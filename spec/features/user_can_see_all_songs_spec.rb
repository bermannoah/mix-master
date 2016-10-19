require 'rails_helper'

RSpec.feature "User views all songs" do
  scenario "they visit the songs index page" do
    artist = create(:artist_with_songs)
    
    visit all_songs_path
    click_on "I Would Walk 12 Miles"
    
    expect(page).to have_content "I Would Walk 12 Miles"
    expect(page).to have_content "Edit"
    
  end
end
