class Message < ActiveRecord::Base
	belongs_to :friendship,class_name: "Friendship"
end
