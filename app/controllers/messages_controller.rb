class MessagesController < ApplicationController
  def new
  	@message=Message.new
  end
  def create
  	@message=Message.new(friend_id: params[:friend_id])
  	if @message.save
  		flash[:notice] = "Message Sent"
  		redirect_to users_path
  	else
  		flash[:error] = "Unable to send message"
  		redirect_to users_path
  	end
  end
end
