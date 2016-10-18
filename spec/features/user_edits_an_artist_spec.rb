require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they have an edit button" do
    Artist.create(name: "Jack White", image_path: "brave")
    
    visit artists_path
    click_on "Jack White"
    expect(page).to have_content "Edit"
  end
  
  scenario "they can access the edit page" do
    Artist.create(name: "Jack White", image_path: "brave")
    
    visit artists_path
    click_on "Jack White"
    click_on "Edit"
    expect(page).to have_content "Name"
  end
  
  scenario "they can access the edit page" do
    new_artist_name = "Meg White"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    
    Artist.create(name: "Jack White", image_path: artist_image_path)
    
    visit artists_path
    click_on "Jack White"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
    click_on "Edit"
    fill_in "artist_name", with: new_artist_name
    click_on "Update Artist"
    expect(page).to have_content "Meg White"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
  
end
