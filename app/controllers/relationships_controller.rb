class RelationshipsController < ApplicationController

    def create
        other_user = User.find(params[:other_user]) 
        current_user.follow(other_user,params[:interest].to_i)
    end 

    def destroy
        other_user = User.find(params[:other_user]) 
        current_user.unfollow(other_user,params[:interest].to_i)
    end 

end
