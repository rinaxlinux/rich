class ProfilesController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]
   
    def top
    end
    
    
    def index
        @profile = Profile.all
    end

    def new
        @profile = Profile.new
    end
    
    def create
        profile = Profile.new(profile_params)
        profile.user_id = current_user.id
        if profile.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end
    
    def show
        @profile = Profile.find(params[:id])
    end

    def edit
        @profile = Profile.find(params[:id])
    end

    def update
        profile = Profile.find(params[:id])
        if profile.update(profile_params)
          redirect_to :action => "show", :id => profile.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        profile = Profile.find(params[:id])
        profile.destroy
        redirect_to action: :index
    end

 private
    def profile_params
        params.require(:profile).permit(:birthday, :name, :blood, :hobby, :character, :image)
    end
     
end
