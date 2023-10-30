class RelationshipsController < ApplicationController

    def create
        @other_user = User.find(params[:other_user]) 
        current_user.follow(@other_user,params[:interest].to_i)
        respond_to do |format|
            format.html
            format.js 
        end 

    end 

    def destroy
        @other_user = User.find(params[:id]) 
        current_user.unfollow(@other_user,params[:interest].to_i)
        respond_to do |format|
            format.html
            format.js {
                render 'relationships/create'
            }
        end 
    end 

end
