require "test_helper"

feature "flight page" do 
  scenario "has content", js: true do 
    visit('/flights')
    page.must_have_content "Airport"
    page.must_have_content "Departure Airport"
    page.must_have_content "Arrival Airport" 
    page.must_have_content "Search" 
  end
end
