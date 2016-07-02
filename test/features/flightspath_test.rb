require "test_helper"

Capybara.register_driver :chrome do |app|
  # optional
  client = Selenium::WebDriver::Remote::Http::Default.new
  # optional
  client.timeout = 120
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :http_client => client)
end

Capybara.javascript_driver = :chrome


feature "flight page" do 
  before do
    if Capybara.current_driver == :selenium
      require 'headless'

      headless = Headless.new
      headless.start
    end
  end
  scenario "has content", js: true do 
    visit('/flights')
    page.must_have_content "Airport"
    page.must_have_content "Search" 
  end
  scenario "select departing flight", js: true do 
    visit("/flights")
    page.fill_in("searchCity" ,:with=>"string")
    page.must_have_content "Flight"
  end
end
