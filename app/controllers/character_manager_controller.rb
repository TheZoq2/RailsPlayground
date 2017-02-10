class CharacterManagerController < ApplicationController
    def index
        old_character = session[:character_id]

        @has_character = false
        if old_character
            @has_character = true

            current_character_id = Character.find(session[:character_id])
            current_character = Character.find(current_character_id)
            @character_name = current_character.name
            @character_level = current_character.level
            @character_health = current_character.health
        else
            @has_character = false
        end

        @character_list = Character.all
    end

    def create
        #permited = params.require(:name).permit(:name);
        @name = params[:character_controller][:name]

        new_character = Character.create(name: @name, level:0, health: 100)

        new_character.save()

        session[:character_id] = new_character.id

        redirect_to action: "index"
    end
end
