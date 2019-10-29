class AuthorsController < ApplicationController
  def show
  	@author = User.find(params[:id].to_i)
  end
end
