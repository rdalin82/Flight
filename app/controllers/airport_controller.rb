class AirportController < ApplicationController
  def index
    if (params[:depart])
      @airports = []
      depart = Airport.where("name like ?", "%#{params[:depart]}").take
      depart.departing_flights.each do |dep| 
        @airports.push(Airport.find(dep.to_airport_id))
      end
      @airports
    else
      @airports = Airport.all
    end
    respond_to do |format|
      format.html
      format.json { render json: @airports }
    end
  end
end
