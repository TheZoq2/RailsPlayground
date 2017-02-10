class Character < ActiveRecord::Base
    has_one :location
    validates :name, presence: true


    def set_location(location)
      self.location = location
    end

    def get_current_location()
        self.location
    end
end
