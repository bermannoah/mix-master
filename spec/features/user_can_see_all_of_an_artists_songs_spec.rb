require 'rails_helper'

RSpec.feature "User views all of an artists songs" do
  scenario "they visit an artists page" do
    artist = create(:artist_with_songs)
    
    visit artist_songs_path(artist)
    click_on "I Would Walk 7 Miles"

    expect(page).to have_content "I Would Walk 7 Miles"
    expect(page).to have_content "Edit"

  end
end
