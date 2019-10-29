class GossipsController < ApplicationController
  def index
  end

  def show
  	@gossip = Gossip.find(params[:id].to_i)
  end

  def new
  	
  end

  def create
  	@gossip = Gossip.new(title: params[:gossip_title],content: params[:gossip_content],user_id: 11) 
  	
  	if @gossip.save # essaie de sauvegarder en base @gossip
    	flash.now[:success] = 'Bravo tu as bien enregistré ton Gossip !'
    	render 'gossips/index', to: 'gossips#index'
    else
    	flash.now[:alert] = "Loupé ! un titre, un contenu et c'est parti!"
    	render 'gossips/new', to: 'gossips#new'
    	
    end
  end

end
