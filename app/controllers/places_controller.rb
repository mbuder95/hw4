class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"]})
  end

  def new
  end

  def create
    if @current_user
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    else
      flash["notice"] = "Login first."
    end
    redirect_to "/places"
  end

end