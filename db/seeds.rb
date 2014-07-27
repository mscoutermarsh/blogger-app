# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
ruby = Category.create!(name: 'Ruby')
heroku = Category.create!(name: 'Heroku')

mike = Author.create!(name: 'Mike')

Post.create!(title: "Deploying a Ruby app to Heroku!",
             content: 'Blog post content goes here',
             author: mike, categories: [ruby, heroku])

Post.create!(title: "Ruby is awesome!",
             content: 'Blog post content goes here',
             author: mike, categories: [ruby] )
