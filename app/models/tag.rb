class Tag < ApplicationRecord
	validates :title, 
	  presence: true,
	  length: { in: 3..14, wrong_length: "3 to 14 characters is allowed" }
	  
	has_many :join_tag_gossips
	has_many :gossips, through: :join_tag_gossips
end
