# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Zone.create(zone_number: 1 ,zone_name:"Laxmi Nagar")
Zone.create(zone_number: 2 ,zone_name:"Dharampeth")
Zone.create(zone_number: 3 ,zone_name:"Hanuman Nagar")
Zone.create(zone_number: 4 ,zone_name:"Dhantoli")
Zone.create(zone_number: 5 ,zone_name:"Nehru Nagar")
Zone.create(zone_number: 6 ,zone_name:"Gandhi Bhagh")
Zone.create(zone_number: 7 ,zone_name:"Satranjipura")
Zone.create(zone_number: 8 ,zone_name:"Lakadganj")
Zone.create(zone_number: 9 ,zone_name:"Ashi Nagar")
Zone.create(zone_number: 10 ,zone_name:"Mangalwari")

zone = Zone.all

zone.each.with_index(1) do |z,index|
	index = 1
	10.times do
		SubZone.create(:name => index, :zone_id => z.id)
		index= index + 1
	end
end

Role.create(:name => "admin")
Role.create(:name => "user")