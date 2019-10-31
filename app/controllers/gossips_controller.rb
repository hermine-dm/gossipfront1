class GossipsController < ApplicationController
    before_action :authenticate_user, except: [:show, :index]
    before_action :authenticate_current_user, only: [:edit, :update, :destroy]

  def index
  end

  def show
  	@gossip = Gossip.find(params[:id].to_i)
  	@comments = Comment.all.to_a
  end

  def new
  end

  def create
  	@gossip = Gossip.new(title: params[:gossip_title],content: params[:gossip_content]) 
  	@gossip.user = current_user
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

   private

  def authenticate_user
    unless current_user
      flash[:alert] = "Please log in."
      redirect_to new_session_path
    end
  end

  def authenticate_current_user
    @gossip = Gossip.find(params[:id].to_i)
    unless current_user.id == @gossip.user_id
    	redirect_to gossips_path
  	end
  end

end
