FactoryGirl.define do
  factory :talk do
    title       { FFaker::Book.title      }
    category    { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
  end
end
