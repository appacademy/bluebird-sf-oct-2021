# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.destroy_all
  
  # Instructors
  elliot = User.create!(username: "all_knowing_elliot", age: 11, political_affiliation: "C", email: "those_are_teef@aa.io", name: 'elliot', password: "qwerty")
  ryan = User.create!(username: "will_climb_rocks", age: 11, political_affiliation: "JavaScript" , email: "boulderz@aa.io", name: 'ryan', password: "qwerty")
  dean = User.create!(username: "dean_machine", age: 11, political_affiliation: "Ruby", email: "deans_diary@aa.io", name: 'dean', password: "qwerty")
  angela = User.create!(username: "loves_capy", age: 11, political_affiliation: "JavaScript", email: "chosenone@aa.io", name: 'angela', password: "qwerty")
  charlos = User.create!(username: "charlos_gets_buckets", age: 11, political_affiliation: "Ruby", email: "ballin@aa.io", name: 'charlos', password: "qwerty")
  alissa = User.create!(username: "cow_luva", age: 11, political_affiliation: "JavaScript" , email: "cows@aa.io", name: 'alissa', password: "qwerty")
  joe = User.create!(username: "trader_joes_4lyf3", age: 11, political_affiliation: "Ruby", email: "thetraderjoe@aa.io", name: 'joe', password: "qwerty")
  walker = User.create!(username: "wakka_wakka", age: 11, political_affiliation: "JavaScript", email: "wakka@wakka.walking", name: 'walker', password: "qwerty")
  mike = User.create!(username: "like_mike", age: 11, political_affiliation: "Ruby", email: "mike@aa.io", name: 'mike', password: "qwerty")
  michelle = User.create!(username: "michelle_bell", age: 11, political_affiliation: "JavaScript", email: "michelle@aa.io", name: 'michelle', password: "qwerty")
  vanessa = User.create!(username: "the_vanessa", age: 11, political_affiliation: "Ruby", email: "vanessa@aa.io", name: 'vanessa', password: "qwerty")
  jen = User.create!(username: "jen_ken_intensifies", age: 11, political_affiliation: "JavaScript", email: "jen@aa.io", name: 'jen', password: "qwerty")
  big_company = User.create!(username: "instructors_rock", age: 52, political_affiliation: "Instructors", email: "giveus@money.now", name: 'big company', password: "qwerty")
  
  Chirp.destroy_all

  # Chirps
  chirp1 = Chirp.create!(author_id: walker.id, body: "Please use my messaging app, WalkerTalker, it's way better than Slack.")
  chirp2 = Chirp.create!(author_id: big_company.id, body: "Hello fellow instructors.")
  chirp3 = Chirp.create!(author_id: big_company.id, body: "Have you seen this sweet instructor merch?")
  chirp4 = Chirp.create!(author_id: michelle.id, body: "Sweeeeeet.")
  chirp5 = Chirp.create!(author_id: mike.id, body: "Kahoots are an opportunity to mess with students.")

  chirp6 = Chirp.create!(author_id: vanessa.id, body: "I am not Michelle.")
  chirp7 = Chirp.create!(author_id: jen.id, body: "This is a random quote I found online. -Some person, 2020.")
  chirp8 = Chirp.create!(author_id: walker.id, body: "You can also check out my sweet game. It was made with JavaScript.")
  chirp9 = Chirp.create!(author_id: walker.id, body: "JavaScript is the best coding language.")

  chirp10 = Chirp.create!(author_id: joe.id, body: "Programmer: A machine that turns coffee into code.")
  chirp11 = Chirp.create!(author_id: big_company.id, body: "You're a wizard, instructor.")

  Like.destroy_all

  # Likes

  # Walker
  Like.create!(liker_id: walker.id, chirp_id: chirp4.id)
  Like.create!(liker_id: walker.id, chirp_id: chirp5.id)
  Like.create!(liker_id: walker.id, chirp_id: chirp6.id)
  Like.create!(liker_id: walker.id, chirp_id: chirp7.id)
  Like.create!(liker_id: walker.id, chirp_id: chirp8.id)
  Like.create!(liker_id: walker.id, chirp_id: chirp9.id)
  Like.create!(liker_id: walker.id, chirp_id: chirp10.id)

  # Michelle
  Like.create!(liker_id: michelle.id, chirp_id: chirp6.id)
  Like.create!(liker_id: michelle.id, chirp_id: chirp7.id)
  Like.create!(liker_id: michelle.id, chirp_id: chirp8.id)
  Like.create!(liker_id: michelle.id, chirp_id: chirp9.id)
  Like.create!(liker_id: michelle.id, chirp_id: chirp4.id)
  Like.create!(liker_id: michelle.id, chirp_id: chirp10.id)

  # Mike
  Like.create!(liker_id: mike.id, chirp_id: chirp4.id)
  Like.create!(liker_id: mike.id, chirp_id: chirp5.id)
  Like.create!(liker_id: mike.id, chirp_id: chirp6.id)

  # Jen
  Like.create!(liker_id: jen.id, chirp_id: chirp5.id)
  Like.create!(liker_id: jen.id, chirp_id: chirp6.id)
  Like.create!(liker_id: jen.id, chirp_id: chirp10.id)

  # Big Company
  Like.create!(liker_id: big_company.id, chirp_id: chirp1.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp4.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp5.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp6.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp7.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp8.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp9.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp10.id)

  # Dean
  Like.create!(liker_id: dean.id, chirp_id: chirp10.id)
  Like.create!(liker_id: dean.id, chirp_id: chirp11.id)
