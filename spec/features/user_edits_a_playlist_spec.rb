# As a user
# Given that a playlist and songs exist in the database
# When I visit that playlist's show page
# And I click on "Edit"
# And I enter a new playlist name
# And I select an additional song
# And I uncheck an existing song
# And I click on "Update Playlist"
# Then I should see the playlist's updated name
# And I should see the name of the newly added song
# And I should not see the name of the removed song

require 'rails_helper'

RSpec.feature "User can edit a playlist" do
  scenario "they can click on edit that brings them to a form to edit playlist" do
    playlist = create(:playlist_with_songs)
    new_song = create(:song)

    visit playlist_path(playlist)
    click_on "Edit"

    expect(current_path).to eq edit_playlist_path(playlist)

    expect(find_field('Name').value).to eq playlist.name
    playlist.songs.pluck(:title).each do |song|
      expect(page.has_checked_field?(song))
    end

    fill_in 'Name', with: "Rockin Tunes"
    check "song-#{new_song.id}"
    click_on "Update Playlist"

    expect(current_path).to eq playlist_path(playlist)
    expect(page).to have_content("Rockin Tunes")
    expect(page).to have_content(new_song.title)
  end
end
