Before do
  if Capybara.current_driver == :selenium
    require 'headless'

    headless = Headless.new
    headless.start
  end
end
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end