FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "The meaning of life #{n}" }
    sequence(:body) { |n| "The meaning of Life is the number #{n}" }
  end
end
