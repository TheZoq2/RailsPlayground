module CombatHelper

  class Card
    def initialize(id, name, description, on_use)
      @id = id
      @name = name
      @description = description
      @on_use = on_use
    end

    def use_card(player, enemy)
      on_use(player, enemy)
    end

    def name
      @name
    end

    def description
      @description
    end

    def get_hash
      hash = {}
      instance_variables.each {|var| 
        hash[var.to_s.delete("@")] = instance_variable_get(var) 
      }
      hash
    end
  end

  def CardUseResult
    def initialize(message, status)
      @message = message
      @status = status
    end

    def message 
      @message
    end
    def status
      @status
    end
  end


  class CardList
    def initialize
      @nextId = 0
      @cards = []

      self.add_card("Attack",
          "Attack the enemy causing some damage",
          lambda do |player, enemy|
            damage = 5 + 0.1 * player.level
            enemy.health -= damage

            CardUseResult(
              "You dealt " + damage.to_s + " to the enemy",
              :continue
            )
          end
        )

      self.add_card("Run away" ,
          "Try to run away from the enemy",
          lambda do |player, enemy|
            damage = 5 + 0.1 * enemy.level
            player.health -= damage

            CardUseResult(
              "You manage to escape but take " + damage.to_s() + " damage",
              :abort
            )
          end
        )
    end

    def add_card(name, description, function)
      @cards << Card.new(@nextId, name, description, function)

      @nextId += 1
    end

    def get_random_card
      @cards.sample
    end
    
    def get_card_by_id(id)
      @cards.first
    end

  end
end
