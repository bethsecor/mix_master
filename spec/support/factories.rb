FactoryGirl.define do
  factory :artist do
    sequence(:name) { |n| "#{n} Artist" }
    image_path "http://bloximages.newyork1.vip.townnews.com/stltoday.com/content/tncms/assets/v3/editorial/8/eb/8eb9d9ef-59bd-58f8-9209-2b927bb1cb8a/52124c1f5849c.preview-620.png"
  end

  # sequence :name do |n|
  #     "#{n} Artist"
  #   end

  sequence :title, ["A", "C", "B", "D", "E"].cycle do |n|
    "#{n} Title"
  end

  factory :song do
    title
    artist
  end

  factory :playlist do
    sequence(:name) { |n| "#{n} Playlist" }

    factory :playlist_with_songs do
      after(:create) do |playlist|
        3.times do
          playlist.songs << FactoryGirl.create(:song)
        end
      end
    end
  end

  factory :playlist_song do
    song
    playlist
  end
end
