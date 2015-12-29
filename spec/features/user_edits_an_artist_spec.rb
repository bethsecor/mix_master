require 'rails_helper'

RSpec.feature "User can edit an artist" do
  scenario "they can click on edit artist link on artist show page" do
    create_three_artists
    artist = Artist.all.first

    visit artist_path(artist)

    expect(page).to have_link("Edit Artist", edit_artist_path(artist))
  end

  scenario "the edit artist link will bring them to an edit page" do
    create_three_artists
    artist = Artist.all.first

    visit artist_path(artist)
    click_link("Edit Artist")

    expect(current_path).to eq edit_artist_path(artist)
  end

  scenario "they can see the artists info and edit it" do
    create_three_artists
    artist = Artist.all.first

    visit edit_artist_path(artist)

    expect(find_field('Name').value).to eq artist.name
    expect(find_field('Image path').value).to eq artist.image_path
  end

  scenario "updates artist info and brings them to show page" do
    create_three_artists
    artist = Artist.all.first

    visit edit_artist_path(artist)

    fill_in "artist_name", with: "The Awesome #{artist.name}"
    click_on "Update Artist"

    expect(page).to have_content "The Awesome #{artist.name}"
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
