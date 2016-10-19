require 'rails_helper'

RSpec.feature "User views all of an artists songs" do
  scenario "they visit an artists page" do
    artist = create(:artist)
    song = create(:song)
    song_2 = create(:song_2)
    
    visit artist_path(artist)
    click_on "New song"
    fill_in "song_title", with: song
    click_on "Create Song"
    click_on "New song"
    fill_in "song_title", with: song_2
    click_on "Create Song"
    
    expect(page).to have_content "Bury It"
    expect(page).to have_content "The Mother We Share"



  end
end
