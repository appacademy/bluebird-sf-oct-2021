FactoryBot.define do 
    factory :chirp do 
        body { "It's chirpalicious!!!" }
        # We know that chirps need an author
        # So we make and author association
        association :author, factory: :user
    end
end