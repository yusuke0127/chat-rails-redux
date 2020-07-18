# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


puts "Running seed file"
puts "Clearing databse..."

Message.destroy_all
User.destroy_all
Channel.destroy_all

channels = ["general", "react", "tokyo"]

channels.each do |channel|
  @channel = Channel.create!(name: channel)
  puts "Done creating #{@channel.name}"
end

puts "Done creating channels"


@yusuke = User.create(
  email: "yusuke@gmail.com",
  password: "123456"
)

puts "Done creating yusuke"

10.times  do
  @message = Message.new(content: Faker::Movie.quote)
  @message.channel = Channel.first
  @message.user = @yusuke
  @message.save!
end

puts "Done creating messages"
