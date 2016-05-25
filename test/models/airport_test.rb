require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup 
    @emptyAirport = Airport.new
    @validAirport = Airport.new(code: "ABC", name: "ABC Airport")
    @onlyname = Airport.new(name: "2nd airport")
    @onlycode = Airport.new(code: "XYZ")
  end

  def teardown
    @emptyAirport = nil
    @validAirport = nil
  end

  test "Should reject empty airport" do 
    assert_not @emptyAirport.save
  end

  test "Should reject airport with only name" do 
    assert_not @onlyname.save
  end

  test "Should reject airport with only code" do 
    assert_not @onlycode.save
  end
  
  test "Should save a valid airport" do 
    assert @validAirport.save
  end
end
