class AirportController < ApplicationController
  def index
    @airports = Airport.all
    respond_to do |format|
      format.json { render json: @airports }
    end
  end
end
