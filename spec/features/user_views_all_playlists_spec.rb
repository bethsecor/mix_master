require 'rails_helper'

RSpec.feature "User can view all playlists" do
  scenario "they see each playlist name that links to the playlist's page" do
    playlist_one, playlist_two, playlist_three = create_list(:playlist, 3)

    visit playlists_path

    expect(page).to have_link(playlist_one.name, href: playlist_path(playlist_one))
    expect(page).to have_link(playlist_two.name, href: playlist_path(playlist_two))
    expect(page).to have_link(playlist_three.name, href: playlist_path(playlist_three))
  end
end
