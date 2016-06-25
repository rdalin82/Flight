require "test_helper"

feature "flight page" do 
  scenario "has content", js: true do 
    visit('/flights')
    page.must_have_content "Airport"
    page.must_have_content "Departure Airport"
    page.must_have_content "Arrival Airport" 
    page.must_have_content "Search" 
  end
  scenario "select departing flight", js: true do 
    visit("/flights")
    find("button", :text=>"Departure Airport").click
    page.must_have_content "MyString"
    find("button", :text=>"Arrival Airport").click
  end
end
