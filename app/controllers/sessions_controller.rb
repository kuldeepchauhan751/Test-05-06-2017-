class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
  user =User.find_by(user_name: params[:session][:user_name]) || User.find_by(email: params[:session][:user_name])


      if user && user.authenticate(params[:session][:password])
        flash[:notice] = "Login Successfully"
        log_in user
      redirect_to user_path(user)
      else

      flash.now[:danger] = 'Invalid Email / Password Combination'

      render 'new'

      end
  end

  def destroy
    log_out
    redirect_to root_url
    end
end
