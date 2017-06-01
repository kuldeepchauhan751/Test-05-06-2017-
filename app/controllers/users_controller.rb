class UsersController < ApplicationController

  before_action :require_user,only: [:index,:show]

  def index
    @users=User.all
  end

  def new
    @user=User.new
  end

  def show
    
  end

  def create
    @user = User.new(user_params)
 
    if @user.save
      redirect_to new_session_path
    
    else
      render 'new'
    end
  end
  
  def edit 

  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :image, :email, :password)
    end
end
