class FlightController < ApplicationController
  def index
    @flights = Flight.all
    @airports = Airport.all

    respond_to do |format| 
      format.html
      format.json { render json: @flights }
    end
  end
end
