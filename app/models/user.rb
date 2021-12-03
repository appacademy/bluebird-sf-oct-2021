# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#  age        :integer
#
class User < ApplicationRecord
    validates :username, :email, presence: true, uniqueness: true
    validates :age, presence: true 
    

    has_many :chirps,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Chirp

    has_many :likes,
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :Like

   #has_many_through 
    has_many :liked_chirps,
        through: :likes,
        source: :chirp
    

    def self.my_all
        users = User.all
        return users
    end

    # Active Record Queries
    # __________________________________________________________________________
    
    #Get first user record, use first
    #User.first # => return a model of the first user in the db

    #Get last user record, use last
    #User.last # => return a model of the last user in the db

    #Find a user that exists by id, use find
    #User.find(3) # => return a mode of the user dean

    #Find a user that doesn't exist by id, use find
    #User.find(25) # => returns ActiveRecord::RecordNotFound: Couldn't find User with 'id'=25

    #Find a user by username, use find_by
    # User.find_by(username: "all_knowing_elliot")

    #Find a user by username that does not exist, use find_by
    #User.find_by(username: :siascone) # => returns nil, does not fail 

    #Find all users between the ages of 10 and 20 inclusive. Show their username, and political affiliation.
    # User
    #     .select(:username, :political_affiliation, :id)
    #     .where("age BETWEEN (?) AND (?)" ,10, 20)
    #Find all users not younger than the age of 11. Use `where.not`
    # User.select("*").where.not("age <= 11")
    # User.where.not("age <= 11")
    # User.where.not(age: "<= 11")
  
    #Find all political_affiliations of our users
    # User.group(:political_affiliation).select(:political_affiliation)
    # User.select(:political_affiliation).distinct

    #Find all users who has a political affiliation in this list and order by ascending
    # political_affiliations = ["Ruby", "C"]
    # User.where(political_affiliation: political_affiliations).order(username: :asc)
end 
