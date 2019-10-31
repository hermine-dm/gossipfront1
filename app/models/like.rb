class Like < ApplicationRecord
	validate :unique_like

	belongs_to :user
	belongs_to :gossip

	def unique_like
		if User.find(user_id).unique(gossip_id)
			errors.add(:gossip_id, "déjà fait") 
		end
	end
end
