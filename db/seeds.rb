require 'pry'

#Variables pour les tests
NB_CITIES = 100
NB_USERS = 50
NB_PRIVATE_MESSAGES = 100
NB_GOSSIPS = 200
NB_TAGS = 500
gossip_ary = Array.new
tag_ary = Array.new

#Cities
NB_CITIES.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Number.leading_zero_number(digits: 5))
end

#Users
NB_USERS.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: Faker::Number.between(from: 1, to: NB_CITIES), email: Faker::Internet.email, age: Faker::Number.between(from: 13, to: 70), description: Faker::Lorem.paragraph(sentence_count: 3, supplemental: true))
end

#Gossips
NB_GOSSIPS.times do
  gossip_ary << Gossip.new(content: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true), title: Faker::TvShows::StrangerThings.quote, user_id: Faker::Number.between(from: 1, to: NB_USERS))
end

#Tags
NB_TAGS.times do
  t = Tag.create(title: Faker::Lorem.word)
  tag_ary << t
  t.save
end

gossip_ary.each do |gossip|
  n = Faker::Number.between(from: 1, to: 5)
  n.times do
     gossip.tags << tag_ary.sample 
  end
  gossip.save
end

NB_PRIVATE_MESSAGES.times do
  pm = PrivateMessage.create(content: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true), sender_id: Faker::Number.between(from: 1, to: NB_USERS))
  n = Faker::Number.between(from: 1, to: 5)
  n.times do
    JoinTablePmRecipient.create(user_id: Faker::Number.between(from: 1, to: NB_USERS), private_message_id:pm.id)
  end
end
