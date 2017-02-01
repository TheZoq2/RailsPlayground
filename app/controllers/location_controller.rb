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
                path_exists = exists_path_between(@location, location)

                {
                    location: location,
                    has_path: path_exists
                }
            }
    end

    def update_paths
        render params
    end

    private
        def location_parameters
            params.require(:location).permit(:name, :description)
        end

        #Check if a path exists between location1 and location2
        def exists_path_between(location_id1, location_id2)
            if Path.find_by(start: location_id1, end: location_id2) and
                Path.find_by(end: location_id1, start: location_id2)
                return true
            end
            return false
        end
end
