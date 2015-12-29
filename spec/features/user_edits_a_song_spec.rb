require 'rails_helper'

RSpec.feature "User can edit a song" do
  scenario "they edit a song with a form when clicking on update song" do
    song = create(:song)

    visit song_path(song)
    click_on "Edit"

    expect(find_field('Title').value).to eq song.title
    fill_in "Title", with: "Brave"
    click_on "Update Song"

    expect(current_path).to eq song_path(song)
    expect(page).to have_content("Brave")
  end
end
