class User < ActiveRecord::Base
  before_save {self.email.downcase}

  has_many :friends, through: :friendship ,dependent: :destroy
  has_many :friendship ,dependent: :destroy

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  
  validates :first_name, presence: true,length: {maximum: 50}

  validates :last_name, presence: true,length: {maximum: 50}

  validates :user_name,presence: true, uniqueness:{:case_sensitive => true},
  		    	format: { with: /\A[a-zA-Z0-9]+\Z/}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true ,format: { with: VALID_EMAIL_REGEX },
            uniqueness:{:case_sensitive => true}

  validates :password,presence: true,
			      length: { minimum: 6 }
  
  has_secure_password

end
