class AuthorsController < ApplicationController

  def index
  end


  def show
  	@author = User.find(params[:id].to_i)
  end
  
  def new
  end

  def create
  	@author = User.new(first_name: params[:author_first_name],last_name: params[:author_last_name],description: params[:author_description],email: params[:author_email],age: params[:author_age],city_id: City.all.sample.id,password: params[:author_password], password_confirmation: params[:author_passwordconf]) 
  	
  	if @author.save 
    	flash.now[:success] = 'Bravo tu as bien été enregistré !'
    	log_in(@author)
    	render :show
    else
    	flash.now[:error] = "Loupé !"
    	render :new
    end
  end
  

end
