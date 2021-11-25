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
    
end 
