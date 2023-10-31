class FoodsController < ApplicationController

  def new
    @food = Food.new
  end

  def index
    if params[:search].present?
      @foods = Food.search(search_arg: params[:search],:page_arg => params[:page], page_count: 4)
    else 
      @foods = Food.paginate(:page => params[:page], :per_page => 4)
    end 
   initialize_user_foods
    if params[:user_id]
      render 'foods/user'
    end 


  end 

  def show 
    @food = Food.find(params[:id])
    @user = User.find(params[:user_id])
  end 

  def change_rating
  end 

  def create
     @food = Food.new(movie_create_params)
     if @food.save
       flash.now[:success] = "Food saved to Database successfully"
       redirect_to foods_url(current_user)
     end 

  end 

  def destroy
    current_user.connect_foods.find_by(food_id: params[:id]).destroy
    @food = Food.find(params[:id])
    initialize_user_foods
    respond_to do |format|
      format.html { redirect_to user_movies_path(current_user) }
      format.js   {
        render 'foods/ate'
      }
    end 
  end 

  def ate
    current_user.connect_foods.get_or_create(id: params[:id]).mark_as_ate! 
    initialize_user_foods
    @food = Food.find(params[:id])
    flash.now[:success] = "Food added to ate list successfully"
    current_user.timelines.food_status(timelineType: @food, attributeValue: "ate")
    respond_to do |format|
      format.html { redirect_to user_movies_path(current_user) }
      format.js   {
        render 'foods/ate'
      }
    end 

  end 

  def to_eat
    current_user.connect_foods.get_or_create(id: params[:id]).mark_as_to_eat!
    initialize_user_foods
    @food = Food.find(params[:id])
    flash[:success] = "Food added to to_eat list successfully"
    current_user.timelines.food_status(timelineType: @food, attributeValue: "to_eat")
    respond_to do |format|
      format.html { redirect_to user_movies_path(current_user) }
      format.js   {
        render 'foods/ate'
      }
    end 

  end 

  def update
    @food = Food.find(food_update_params[:id])
    @user = User.find(food_update_params[:user_id])
    respond_to do |format|
      format.html {
      }
      format.js  {

        if(params[:updated])

          

          if(params[:rating])
            current_user.timelines.food_rating(timelineType: @food, attributeValue: params[:rating])
            current_user.connect_foods.find_by(food_id: food_update_params[:id]).update(rating: food_update_params[:rating])
          elsif(params[:review])
            current_user.timelines.food_review(timelineType: @song, attributeValue: params[:review])
            current_user.connect_foods.find_by(food_id: food_update_params[:id]).update(review: food_update_params[:review])
          end

        end 
          

      }
    end
  end 

  private 

  def actual_user
    params[:user_id] ? User.find(params[:user_id]) : current_user
  end

  def food_create_params
    params.require(:food).permit(:name,:image)
  end 

  def food_update_params
    params.permit(:rating,:review,:id,:user_id)
  end 

  def initialize_user_foods
    @user = actual_user
    @ate_foods = @user&.connect_foods.ate_foods
    @to_eat_foods = @user&.connect_foods.to_eat_foods
  end 

end
