require 'faker'

10.times do
  Todo.create(
    title: Faker::Lorem.sentence
  )
end
todos = Todo.all

puts "Seed finished"
puts "#{Todo.count} todos created"