class UsersController < ApplicationController
    def show
        @user=User.find(params[:id])
     @komatai = @user.profiles.order(created_at: :desc)
    end
end
