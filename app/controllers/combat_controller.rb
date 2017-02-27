class CombatController < ApplicationController
  before_action :get_player_character

  def index
    @combat = "Insert enemy type here"
  end

  def new_card
    id = 5;
    card = CombatHelper::CardList.new.get_random_card
    card = card.get_hash
    card[:url] = use_card_url(id)

    puts "Card: " + card.to_s

    respond_to do |format|
      format.html { render json: card, status: :created, location: "yolo" }
      format.json { render json: card, status: :created, location: "yolo" }
    end
  end

  def use_card
    #Do something

    @player.health -= 1

    @player.save

    send_status()
  end

  def status
    send_status
  end

  private
    def get_player_character
      @player = Character.find(session[:character_id])
    end

    def send_status
      status = {
        player: {
          health: @player.health,
          level: @player.level
        }
      }

      respond_to do |format|
        format.html { render json: status, status: :created, location: "yolo" }
        format.json { render json: status, status: :created, location: "yolo" }
      end
    end
end
