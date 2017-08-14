FactoryGirl.define do
  factory :shorty do
    original "google.com"
    shortened { Faker::Internet.password(5, 5) }
  end
end
