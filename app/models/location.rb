class Location < ActiveRecord::Base
    has_many :paths, :foreign_key => "first_location_id",
        :class_name => "Path"

    has_many :neighbours ,through: :paths, :source => "second_location"

    def set_paths(location_list)
        location_list.each do |other_location, connected|
            if connected
                self.add_path(other_location)
            else
                self.remove_path(other_location)
            end
        end
    end

    def add_path(other_location)
        unless self.has_path_to(other_location)
            other_location.neighbours << self

            self.neighbours << other_location
        end
    end

    def has_path_to(other_location)
        self.neighbours.include? other_location
    end

    def remove_path(other_location)
        if self.has_path_to(other_location)
            self.neighbours.delete(other_location)
            other_location.neighbours.delete(self)
        end
    end
end
