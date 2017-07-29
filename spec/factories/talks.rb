FactoryGirl.define do
  factory :talk do
    title       { Faker::Book.title      }
    category    { Faker::Superhero.power }
    description { Faker::Lorem.paragraph }
    length_of_talk { 5 }
  end
end
