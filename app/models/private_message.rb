class PrivateMessage < ApplicationRecord
	  belongs_to :user
	  has_many :join_pms
      
end
