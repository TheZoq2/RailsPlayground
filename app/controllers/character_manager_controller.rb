class CharacterManagerController < ApplicationController
    def index
        old_character = session[:character_id]

        @has_character = false
        current_character_id = Character.find_by_id(session[:character_id]);

        if old_character and current_character_id
            @has_character = true

            current_character = Character.find(current_character_id)
            @character_name = current_character.name
            @character_level = current_character.level
            @character_health = current_character.health

            @location_name = current_character.location.name if current_character
        end

        @character_list = Character.all
    end

    def create
        #permited = params.require(:name).permit(:name);
        @name = params[:character_controller][:name]

        starting_location = Location.first

        new_character = Character.create(
                name: @name, level:0, health: 100, location: starting_location
            )

        new_character.save()

        session[:character_id] = new_character.id

        redirect_to action: "index"
    end

    def deselect
        session[:character_id] = nil
        redirect_to action: "index"
    end
end
