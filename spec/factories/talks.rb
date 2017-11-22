FactoryGirl.define do
  factory :talk do
    title       { FFaker::Book.title      }
    category    { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
    length_of_talk { 5 }
  end
end
