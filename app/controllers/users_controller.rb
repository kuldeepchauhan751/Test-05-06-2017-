class UsersController < ApplicationController

  before_action :require_user,only: [:index,:show]

  def index

    @users=User.all.where('id!=?', current_user)
  end

  def new
    @user=User.new
  end

  def show
    @user=User.find_by(id: session[:user_id])
  end

  def create
    @user = User.new(user_params)
 
    if @user.save
      flash[:notice] = "Signup Successfully"
      log_in @user
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
