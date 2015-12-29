require 'rails_helper'

RSpec.feature "User can delete an artist" do
  scenario "they can click on delete artist link on artist show page and are redirected to index" do
    create_three_artists
    artist = Artist.all.first

    visit artist_path(artist)

    expect(page).to have_link("Delete Artist", artist_path(artist))
    click_on "Delete Artist"

    expect(current_path).to eq artists_path
    expect(page).not_to have_link(artist.name, artist_path(artist))
  end
end
