class GameController < ApplicationController
  def index
    character = Character.find(session[:character_id])

    @location = character.location
  end

  #TODO: Make sure you can't travel to a location that is not a neighbour of 
  #your current location
  def travel_to
    character = Character.find(session[:character_id])

    target_location = Location.find(params[:id])

    puts "target_location" + target_location.to_s
    puts "current_location" + character.location.to_s

    character.set_location(target_location)

    redirect_to action: "combat"
  end

  def combat
    @combat = "Insert enemy type here"
  end

  def new_card
    card = {
      id: 5,
      name: "Great card",
      description: "Does really nice things"
    }

    respond_to do |format|
      format.html { render json: card, status: :created, location: "yolo" }
      format.json { render json: card, status: :created, location: "yolo" }
    end
  end
end
