require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they have a delete button" do
    Artist.create(name: "Jack White", image_path: "brave")
    
    visit artists_path
    click_on "Jack White"
    expect(page).to have_content "Delete"
  end
  
  scenario "they can delete an artist" do
    Artist.create(name: "Jack White", image_path: "brave")
    Artist.create(name: "Meg White", image_path: "brave")
    
    visit artists_path
    
    expect(page).to have_content "Meg White"
    expect(page).to have_content "Jack White"
    click_on "Jack White"
    click_on "Delete"
    
    expect(page).to have_content "Meg White"
    expect(page).to_not have_content "Jack White"
  end
end