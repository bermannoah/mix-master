FactoryGirl.define do
  factory :artist do
    name        "Bob Marley"
    image_path  "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
  end
end

FactoryGirl.define do
  factory :song do
    sequence(:title) { |a, b, c| "I Would Walk #{a}#{b}#{c} Miles"}
    artist nil
  end
end