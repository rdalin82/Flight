class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: Airport
  belongs_to :to_airport, class_name: Airport
  validate :valid_flight

  def valid_flight
    if self.from_airport == self.to_airport
      errors.add("Flights can not start and end in the same place")
    end
  end

end
