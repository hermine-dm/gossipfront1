class CommentsController < ApplicationController
	
	def new
	end

	def create
	@comment = Comment.new(content: params[:comment_content],gossip_id: params[:gossip_id],user_id: 10) 
  	
  	if @comment.save
    	#flash.now[:success] = 'Bravo tu as bien enregistré ton comment !' a faire marcher
    	render template: 'gossips/index'
    else
    	#flash.now[:alert] = "Loupé !"
    	render template: 'gossips/index'
    	
    end
  end
end
