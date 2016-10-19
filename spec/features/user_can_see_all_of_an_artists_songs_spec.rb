require 'rails_helper'

RSpec.feature "User views all of an artists songs" do
  scenario "they visit an artists page" do
    artist = create(:artist_with_songs)
    
    visit artist_songs_path(artist)
    save_and_open_page
    click_on "I Would Walk 7 Miles"

    expect(page).to have_content "I Would Walk 7 Miles"
    expect(page).to have_content "Edit"
  end
  
  scenario "they delete an artist's song" do
    artist = create(:artist_with_songs) 
    
    visit artist_songs_path(artist)
    click_on "I Would Walk 12 Miles" 
    click_on "Delete"
    expect(page).to have_content "Bob Marley 5"
    click_on "Bob Marley 5"
    click_on "View songs"
    expect(page).to have_content "I Would Walk 13 Miles"
    expect(page).to_not have_content "I Would Walk 12 Miles"
    
  end
end
