require 'faker'

5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end
users = User.all

50.times do
  Todo.create(
    user:   users.sample,
    title:  Faker::Lorem.sentence
  )
end

User.first.update_attributes(
  email:  'i3d@ironic3d.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Todo.count} todos created"