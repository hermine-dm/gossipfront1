class JoinPm < ApplicationRecord
	validates :user_id,
	    presence: true,
	    numericality: { only_integer: true, greater_than_or_equal_to: 1}
	validates :private_message_id,
	    presence: true,
	    numericality: { only_integer: true, greater_than_or_equal_to: 1}
	    
	belongs_to :user
	belongs_to :private_message
end
