require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they visit the artists index" do
    artist_name_1 = "Joe Strummer"
    artist_name_2 = "Bob Marley"
    Artist.create(name: artist_name_1, image_path: "google")
    Artist.create(name: artist_name_2, image_path: "bing")

    visit artists_path
    expect(page).to have_content "Bob Marley"
    expect(page).to have_content "Joe Strummer"
    
    click_on "Bob Marley"
    expect(page).to have_content "Bob Marley"
  end
end