class Path < ActiveRecord::Base
    belongs_to :first_location,
        :foreign_key => "first_location_id",
        :class_name => "Location"

    belongs_to :second_location, 
        :foreign_key => "second_location_id",
        :class_name => "Location"
end
