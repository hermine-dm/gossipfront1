class CitiesController < ApplicationController
  def show
  	@city = City.find(params[:id].to_i)
  	@users = User.all.to_a
  end
end
