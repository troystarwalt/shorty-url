FactoryGirl.define do
  factory :shorty do
    original "google.com"
    shortened { Faker::Internet.password(5, 5) }
  end

  factory :invalid_shorty, class: Shorty do
    original "www.google .com"
    shortened { Faker::Internet.password(5, 5) }
  end
end
