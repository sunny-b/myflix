# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
videos = [
  ['Family Guy', 'Animated show about a typical American family', '/tmp/family_guy.jpg', "http://dummyimage.com/665x375/000000/00a2ff"],
  ['Futurama', 'Show about the future', '/tmp/futurama.jpg', "http://dummyimage.com/665x375/000000/00a2ff"],
  ['Monk', 'Detective Show', '/tmp/monk.jpg', '/tmp/monk_large.jpg'],
  ['South Park', 'Animated show foul mouthed kids', '/tmp/south_park.jpg', "http://dummyimage.com/665x375/000000/00a2ff"],
]

videos.each do |title, description, small_cover_url, large_cover_url|
  Video.create!(title: title, description: description, small_cover_url: small_cover_url, large_cover_url: large_cover_url)
end
