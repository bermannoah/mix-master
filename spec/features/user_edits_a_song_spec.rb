require 'rails_helper'

RSpec.feature "User edits a song" do
  scenario "they have an edit button" do
    artist = create(:artist)
    song = create(:song)

    visit artist_path(artist)
    click_on "The Mother We Share"
    expect(page).to have_content "The Mother We Share"
  end
  
  scenario "they can access the edit page" do
    artist = create(:artist)
    song = create(:song)
    
    visit artist_path(artist)
    click_on "The Mother We Share"
    click_on "Edit"
    expect(page).to have_content "Title"
  end
  
  scenario "they can access the edit page" do
    artist = create(:artist)
    song = create(:song)
    new_song_name = "Bury It"
    
    visit artist_path(artist)
    click_on "The Mother We Share"
    click_on "Edit"
    expect(page).to have_content "Title"
    fill_in "song_title", with: new_song_name
    click_on "Update Song"
    expect(page).to have_content "Bury It"
  end
  
end
