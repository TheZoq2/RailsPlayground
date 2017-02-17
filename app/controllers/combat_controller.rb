class CombatController < ApplicationController
  def index
    @combat = "Insert enemy type here"
  end

  def new_card
    id = 5;
    card = {
      id: id,
      name: "Great card",
      description: "Does really nice things",
      url: use_card_url(id)
    }

    respond_to do |format|
      format.html { render json: card, status: :created, location: "yolo" }
      format.json { render json: card, status: :created, location: "yolo" }
    end
  end

  def use_card
    #Do something

    player = Character.find(session[:character_id])
    player.health -= 1

    player.save

    puts "Player health", player.health

    send_status()
  end

  private
    def send_status
      player = Character.find(session[:character_id])

      status = {
        player: {
          health: player.health,
          level: player.level
        }
      }

      respond_to do |format|
        format.html { render json: status, status: :created, location: "yolo" }
        format.json { render json: status, status: :created, location: "yolo" }
      end
    end
end
