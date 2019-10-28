class JoinPm < ApplicationRecord
	belongs_to :user
	belongs_to :private_message
end
