require 'rails_helper'

RSpec.feature "User views all songs" do
  scenario "they visit the songs index page" do
    artist = create(:artist_with_songs)
    
    visit songs
    click_on "I Would Walk 17 Miles"
    
    expect(page).to have_content "I Would Walk 17 Miles"
    expect(page).to have_content "Edit"
    
  end
end
