FactoryGirl.define do
  factory :song do
    sequence(:title) { |n| "I Would Walk #{n} Miles"}
    artist 
  end
  
  factory :artist do
    sequence(:name) { |n| "Bob Marley #{n}"}
    image_path  "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    
    factory :artist_with_songs do
      transient do
        songs_count 5
      end
      
      after(:create) do |artist, evaluator|
        create_list(:song, evaluator.songs_count, artist: artist)
      end
    end
  end
end