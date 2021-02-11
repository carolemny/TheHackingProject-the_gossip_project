require 'pry'

#Variables pour les tests
NB_CITIES = 20
NB_USERS = 100
NB_PRIVATE_MESSAGES = 500
NB_GOSSIPS = 200
NB_TAGS = 50
gossip_ary = Array.new
tag_ary = Array.new
cities = []
users = []
pms= []

#Cities
NB_CITIES.times do
  cities << City.new(name: Faker::Address.city, zip_code: Faker::Number.leading_zero_number(digits: 5))
end
City.create(cities.map { |elem| elem.as_json })

#Users
NB_USERS.times do
  users << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: Faker::Number.between(from: 1, to: NB_CITIES), email: Faker::Internet.email, age: Faker::Number.between(from: 13, to: 70), description: Faker::Lorem.paragraph(sentence_count: 3, supplemental: true), password: Faker::Internet.password(min_length: 6))
end

#Gossips
NB_GOSSIPS.times do
  gossip_ary << Gossip.new(content: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true), title: Faker::Book.title[0..13], user_id: Faker::Number.between(from: 1, to: NB_USERS))
end

#Tagss[]
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
end
Gossip.create(gossip_ary.map { |elem| elem.as_json })

#NB_PRIVATE_MESSAGES.times do
#  pm = PrivateMessage.new(content: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true), sender_id: Faker::Number.betweenfrom: 1, to: NB_USERS))
#  n = Faker::Number.between(from: 1, to: 5)
#  n.times do
#    JoinTablePmRecipient.create(user_id: Faker::Number.between(from: 1, to: NB_USERS), private_message_id:pm.id)
#  end
#  pms << pm
#end
#PrivateMessage.create(pms.map { |elem| elem.as_json })
