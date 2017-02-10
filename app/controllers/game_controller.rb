class GameController < ApplicationController
    def index
        character = Character.find(session[:character_id])

        @location = character.location
    end
end
