class Airport < ActiveRecord::Base
  validates :code, uniqueness: true, presence: true
  validates :name, presence: true
  has_many :departing_flights, class_name: "Flight", foreign_key: "from_airport_id"
  has_many :arriving_flights, class_name: "Flight", foreign_key: "to_airport_id"
end
