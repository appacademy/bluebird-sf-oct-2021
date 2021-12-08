FactoryBot.define do
    factory :user do 
        username { Faker::Movies::HarryPotter.character }
        email { Faker::Internet.email }
        password { 'starwars' }
        age { 20 }
        political_affiliation { Faker::Movies::HarryPotter.house }
    end
end