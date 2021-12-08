require 'rails_helper'

feature 'Creating a Chirp', type: :feature do
    before :each do 
        FactoryBot.create(:user)
    end

    scenario 'takes a body' do 
        log_in_user(User.last)
        visit new_chirp_url
        expect(page).to have_content "New chirp"
        expect(page).to have_content "Body"
    end

    scenario "takes us back to chirp show" do 
        log_in_user(User.last)
        make_chirp("it's raining")

        expect(page).to have_content "Look at this chirp!"
        expect(page).to have_content "it's raining"
        expect(current_path).to eq(chirp_path(Chirp.last))
    end
end

feature "Dechirping a chirp", type: :feature do 
    before :each do 
        FactoryBot.create(:user)
        log_in_user(User.last)
        make_chirp("to be deleted")
        # save_and_open_page
        click_button('Delete this Chirp')
        # save_and_open_page
    end

    scenario 'dechirps a chirp' do 
        expect(page).to_not have_content("to be deleted")
        expect(page).to have_content("All the chirps!") 
        expect(current_path).to eq(chirps_path)
    end
end