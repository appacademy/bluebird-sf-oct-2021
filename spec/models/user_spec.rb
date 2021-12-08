require 'rails_helper'

RSpec.describe User, type: :model do 
    let(:incomplete_user) { 
        User.new(username: "", 
        email: 'email@aa.io', 
        password: 'password')
    }

    # the old rspec way of validating
    # it 'validates presence of a username' do 
    #     expect(incomplete_user).to_not be_valid
    # end

    # the new way with shouldamatchers
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6)}

    # it { should validate_uniqueness_of(:username) }
    # subject(:toby) { User.create(
    #     username: 'toby',
    #     email: 'toby@aa.io',
    #     age: 5,
    #     political_affiliation: 'Hufflepuff',
    #     password: 'password'
    # )
    # }

    describe "uniqueness" do 
        before :each do 
            FactoryBot.create(:user)
        end

        it { should validate_uniqueness_of(:username) }
        it { should validate_uniqueness_of(:email) }
        it { should validate_uniqueness_of(:session_token) }

    end

    describe '#is_password?' do 
        let!(:user) { FactoryBot.create(:user) }
        # The difference between let and let! is that let! is called in an 
        # implicit before block. Which means that result is evaluated  and 
        # cached before our it blocks

        context 'with a valid password' do 
            it "should return true" do 
                expect(user.is_password?('starwars')).to be true
            end 
        end

        context 'with an invalid password' do 
            it 'should return false' do 
                expect(user.is_password?("StarTrek")).to be false
            end
        end
    end

    describe 'password encryption' do 

        it 'does not save passwords to the database' do 
            FactoryBot.create(:user, username: 'Harry Potter')

            user = User.find_by(username: 'Harry Potter')
            expect(user.password).to_not eq('starwars')
        end

        it 'encrypts password using BCrypt' do 
            expect(BCrypt::Password).to receive(:create).with('abcdef')

            FactoryBot.build(:user, password: 'abcdef')
        end

    end

end