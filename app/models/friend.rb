class Friend < ActiveRecord::Base

belongs_to :user,foreign_key: true

end
