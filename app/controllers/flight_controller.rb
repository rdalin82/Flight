class FlightController < ApplicationController
  def index
    @airports = Airport.all
    if (params[:depart] && params[:arrive])
      depart = Airport.where("name = ?", params[:depart]).take
      arrive = Airport.where("name = ?", params[:arrive]).take
      @flights = Flight.where("from_airport_id = ? AND to_airport_id = ?", depart.id, arrive.id)
    else 
      @flights = []
    end
    respond_to do |format| 
      format.html
      format.json { render json: @flights }
      
    end
  end
end
