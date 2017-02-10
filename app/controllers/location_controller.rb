class LocationController < ApplicationController
    def index
        @locations = Location.all

        @location = Location.new
    end

    def create
        @location = 
            Location.create(location_parameters())

        redirect_to action: "index"
    end

    def edit
        @location = Location.find(params[:id])
    end

    def update
        @location = Location.find(params[:id])

        @location.update(location_parameters())

        redirect_to action: "index"
    end

    def destroy
        @location = Location.find(params[:id])

        @location.destroy

        redirect_to action: "index"
    end

    def edit_paths
        @location = Location.find(params[:id])

        @locations = Location.all

        @locations = @locations.select{|location| location != @location}
        @locations = @locations.map{|location| 
                path_exists = @location.has_path_to(location)

                {
                    location: location,
                    has_path: path_exists
                }
            }
    end

    def update_paths
        location = Location.find([params[:id]]).first

        other_locations = params.require(:location)

        location_list = {}

        other_locations.each do |other_location, connected|
            other_id = other_location.to_i
            other = Location.find(other_id)

            location_list[other] = connected == "1"
        end

        location.set_paths(location_list)

        redirect_to action: "index"
    end

    private
        def location_parameters
            params.require(:location).permit(:name, :description)
        end
end
