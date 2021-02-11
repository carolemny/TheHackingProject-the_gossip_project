class CitiesController < ApplicationController
  def index
    @all_cities = City.all
  end

  def show
    @city = City.find(params["id"])
  end

  def new
    @city = City.new
  end
end
