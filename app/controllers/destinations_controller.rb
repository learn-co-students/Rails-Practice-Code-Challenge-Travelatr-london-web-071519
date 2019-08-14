class DestinationsController < ApplicationController


    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
    end


    private

    def destination_params
        params.require(:post).permit(:name, :country)
    end

end