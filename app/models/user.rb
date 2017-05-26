class User < ActiveRecord::Base
  has_many :friends

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :user_name,presence: true, uniqueness:{:case_sensitive => true},
  			format: { with: /\A[a-zA-Z0-9]+\Z/ , message: "must contain no spaces" }

  validates :email, presence: true , uniqueness:{:case_sensitive => true},
  			length: { minimum: 2 ,message: "must contain no spaces"}

  validates :password,presence: true,
			length: { minimum: 6 , message: "weak password"}


end
