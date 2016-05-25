class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: Airport
  belongs_to :to_airport, class_name: Airport
  validate :valid_flight
  validates :from_airport, presence: true
  validates :to_airport, presence: true
  validates :duration, presence: true
  validates :start, presence: true 

  def valid_flight
    if self.from_airport == self.to_airport
      errors.add("Flights can not start and end in the same place")
    end
  end

end
