require 'rails_helper'

RSpec.feature "User edits a song" do
  scenario "they have an edit button" do
    artist = create(:artist)
    song_name = create(:song)

    visit artist_path(artist)
    click_on "New song"
    fill_in "song_title", with: song_name.title
    click_on "Create Song"
    expect(page).to have_content "I Would Walk"
  end
  
  scenario "they can access the edit page" do
    artist = create(:artist)
    song_name = create(:song)
    
    visit artist_path(artist)
    click_on "New song"
    fill_in "song_title", with: song_name.title
    click_on "Create Song"
    click_on "Edit"
    expect(page).to have_content "I Would Walk"
  end
  
  scenario "they can edit with the edit page" do
    artist = create(:artist)
    song_name = create(:song)
    new_song_name = "Bury It"
    
    visit artist_path(artist)
    click_on "New song"
    fill_in "song_title", with: song_name.title
    click_on "Create Song"
    click_on "Edit"
    expect(page).to have_content "Title"    
    fill_in "song_title", with: new_song_name
    click_on "Update Song"
    expect(page).to have_content "Bury It"
    click_on "Bob Marley"
    expect(page).to have_content "Bob Marley"
  end
  
end
