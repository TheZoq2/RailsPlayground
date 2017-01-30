class LocationController < ApplicationController
    def index
        @locations = Location.all
    end

    def create
        form_data = params[:location_controller];

        Location.create(name: form_data[:name], description: form_data[:description])

        redirect_to action: "index"
    end
end
