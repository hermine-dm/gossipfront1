class CommentsController < ApplicationController
	before_action :get_gossip
	before_action :authenticate_user, except: [:index]

	def index
		@comments = @gossip.comments
	end

	def new
	end

	def create
	@comment = @gossip.comments.new(content: params[:comment_content],gossip_id: params[:gossip_id])
	@comment.user = current_user 
  		if @comment.save
    		flash.now[:success] = 'Bravo tu as bien enregistré ton comment !'
    		render template: 'gossips/index'
    	else
    		flash.now[:alert] = "Loupé !"
    		render template: 'gossips/index'
    	end
  	end

  	def edit
  		@gossip = Gossip.find(params[:gossip_id].to_i)
  		@comment = @gossip.comments.find(params[:id].to_i)
  	end

  	def update
  		@gossip = Gossip.find(params[:gossip_id].to_i)
  		@comment = @gossip.comments.find(params[:id].to_i)
   		if @comment.update(content: post_params[:content],gossip_id: @gossip.id)
  			redirect_to gossip_path(@gossip), notice: 'Le gossip a été mis à jour.'
  		else
  			#flash.now[:alert] = "Loupé !"
  			render :edit
  		end
  	end

  	def destroy
  		@gossip = Gossip.find(params[:gossip_id].to_i) #pourquoi ca ne reprend pas la fct private..
  		@comment = @gossip.comments.find(params[:id].to_i)
  		@comment.destroy
  		redirect_to gossip_path(@gossip), notice: 'Le gossip a été supprimé.'
  	end

  	private
 		def get_gossip
    		@gossip = Gossip.find(params[:gossip_id].to_i)
  		end

  		def post_params
      		params.require(:comment).permit(:content, :gossip_id)
    	end

		def authenticate_user
		    unless current_user
		      flash[:alert] = "Please log in."
		      redirect_to new_session_path
		    end
		end
end
