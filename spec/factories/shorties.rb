FactoryGirl.define do
  factory :shorty do
    original "google.com"
  end

  factory :invalid_shorty, class: Shorty do
    original "www.google .com"
  end
end
