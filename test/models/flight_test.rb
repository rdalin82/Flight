require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  def setup
    @from = Airport.create!(code: "ABC", name: "ABC, USA")
    @to = Airport.create!(code: "XYZ", name: "XYZ, USA")
    @validFlight = Flight.new(start: Date.today, from_airport: @from, to_airport: @to, duration: 200)
    @novalidFlight = Flight.new(from_airport: @from, to_airport: @to)
  end

  test "Should save flight" do 
    assert @validFlight.save
  end

  test "Should not save invalid flight" do 
    assert_not @novalidFlight.save
  end
end
