# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

module Database
  # (2014..2016).reverse_each do |year| 
  year = 2015
  Builder.new(year).run
  # GameStatBuilder.new(year).run
  # QuarterStatBuilder.new(year).run
  # end
end
