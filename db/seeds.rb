# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'csv'
# CSV.foreach(Rails.root.join("db/seeds_data/whiskies.csv"), headers: true) do |row|
#  Whisky.find_or_create_by(name: row[0], old: row[1], price: row[2], liter: row[3], land: row[4], volume: row[5], description: row[6], pic_url: row[7])
# end

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'whiskies.csv'))
puts csv_text