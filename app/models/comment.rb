class Comment < ApplicationRecord
	validates :content,
	  presence: true
	belongs_to :user		#Comment en relation N-1 avec user et gossip 
	belongs_to :gossip
	
end
