class Gossip < ApplicationRecord
	validates :title, 
	  presence: true,
	  length: { in: 3..14, wrong_length: "3 to 14 characters is allowed" }
	validates :content,
	  presence: true,
	  length: { minimum: 50, too_short: "50 characters is the minimum allowed" }
	
	belongs_to :user
	has_many :comments
	has_many :join_tag_gossips
	has_many :tags, through: :join_tag_gossips
	has_many :likes

end
