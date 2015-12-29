require 'rails_helper'

RSpec.feature "User can access artist index page" do
  scenario "they see a page with all of the artists listed" do
    create_three_artists
    visit artists_path

    three_artists.each do |name, image_path|
      expect(page).to have_content name
    end

    Artist.all.each do |artist|
      expect(page).to have_link(artist.name, artist)
    end
  end
end
