class JoinTagGossip < ApplicationRecord
	validates :tag_id,
	    presence: true,
	    numericality: { only_integer: true, greater_than_or_equal_to: 1}
	validates :gossip_id,
	    presence: true,
	    numericality: { only_integer: true, greater_than_or_equal_to: 1}
	belongs_to :tag 
	belongs_to :gossip
end
