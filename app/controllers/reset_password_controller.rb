class ResetPasswordController < ApplicationController
  def new
    @user=User.new
  end

  def create
    
  	@user = User.find_by(email: params[:email],security_check: params[:security_check])
    
  	if @user
  		redirect_to edit_reset_password_path(@user)
  	else
  		flash[:danger]=" Invalid email or Security Check "
  		render 'new'
  	end
  end

  def edit
  	@user=User.find_by(email: params[:email],security_check: params[:security_check])
  end

  def update
  	@user=User.find_by(id: params[:id])
  	@password=@user.update(password: params[:password])
  	if @password
  		flash[:notice]= "Password Updated Successfully"
  		redirect_to login_path
  	else
  		flash[:danger]="Something Went Wrong...!"
  		render 'edit'
  	end
  end
end
