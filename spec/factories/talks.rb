FactoryGirl.define do
  factory :talk do
    title       { Faker::Book.title      }
    category    { Faker::Superhero.power }
    description { Faker::Lorem.paragraph }
  end
end
