class PrivateMessage < ApplicationRecord
	  validates :content,
	    presence: true
	  
	  belongs_to :user
	  has_many :join_pms
	  has_many :users, through: :join_pms
      
end
