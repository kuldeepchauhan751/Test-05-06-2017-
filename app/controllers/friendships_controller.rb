class FriendshipsController < ApplicationController
  def create
  if current_user
  	@friendship=current_user.friendship.build(friend_id: params[:friend_id])
  	if @friendship.save
  		flash[:notice] = "Added Friend"
  		redirect_to users_path
  	else
  		flash[:error] = "Unable to add friend"
  		redirect_to users_path
  	end
  	else
  	redirect_to login_path
    end
  end

  def destroy
    if current_user
  	@friendship = current_user.friendship.find(params[:format])
  	@friendship.destroy
  	flash[:notice] = "Removed Friendship"
  	redirect_to current_user
    else
  	redirect_to login_path
    end
  end
end