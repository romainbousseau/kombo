# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


skills = ["seo", "sea", "product manager", "analytics", "programmatic", "data analyst", "developer", "content manager", "revemue manager", "web designer"]

skills.each {|skill| Skill.create!(name: skill)}
