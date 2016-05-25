# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


## AIRPORTS see config/initializers/parser.rb 
if !Airport.any?
  AIRPORTS.each do |k, v|
    Airport.create(name: k, code: v)
  end 
end

if !Flight.any? 
  1000.times do |entry| 
    date = Faker::Time.between(20.days.from_now, Date.today, :all)
    start = Airport.find(rand(1..Airport.count))
    stop = Airport.find(rand(1..Airport.count))
    duration = Faker::Number.between(30, 240)
    if start != stop 
      Flight.create!(
        start: date, 
        to_airport: stop,
        from_airport: start,
        duration: duration
        )
    end
  end
end



