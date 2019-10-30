class GossipsController < ApplicationController
  def index
  end

  def show
  	@gossip = Gossip.find(params[:id].to_i)
  	@comments = Comment.all.to_a
  end

  def new
  end

  def create
  	@gossip = Gossip.new(title: params[:gossip_title],content: params[:gossip_content],user_id: 11) 
  	
  	if @gossip.save # essaie de sauvegarder en base @gossip
    	flash.now[:success] = 'Bravo tu as bien enregistré ton Gossip !'
    	render :index
    else
    	flash.now[:alert] = "Loupé ! un titre, un contenu et c'est parti!"
    	render :new
    end
  end

  def edit
  	@gossip = Gossip.find(params[:id].to_i)
  end

  def update
  	@gossip = Gossip.find(params[:id].to_i)
  	post_params = params.require(:gossip).permit(:title, :content)
   	if @gossip.update(title: post_params[:title],content: post_params[:content],user_id: @gossip.user_id)
  		redirect_to @gossip
  	else
  		flash.now[:alert] = "Loupé !"
  		render :edit
  	end
  end

  def destroy
  	@gossip = Gossip.find(params[:id].to_i)
  	@gossip.destroy
  	render :index
  end
end
