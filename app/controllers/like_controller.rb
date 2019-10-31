class LikeController < ApplicationController
	before_action :get_gossip
	before_action :authenticate_user

	def index
		@likes= @gossip.likes
	end

	def create
		@like = @gossip.likes.new(gossip_id: params[:gossip_id])
		@like.user = current_user 
  		@like.save
  		redirect_to gossip_path(@gossip)
	end

	def destroy
		@gossip = Gossip.find(params[:gossip_id].to_i) #pourquoi ca ne reprend pas la fct private..
  		@like = @gossip.likes.find(params[:id].to_i)
  		@like.destroy
  		redirect_to gossip_path(@gossip), notice: 'Le like a été supprimé.'
	end

	private

 		def get_gossip
    		@gossip = Gossip.find(params[:gossip_id].to_i)
  		end

  		def authenticate_user
    		unless current_user
      		flash[:alert] = "Please log in."
      		redirect_to new_session_path
    	end
  end

end
