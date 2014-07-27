## Blogger App
Sample Rails App

## Requirements
Postgres & Ruby 2.1.2

## Installation

```
$ git clone https://github.com/mscoutermarsh/blogger-app
$ cd blogger-app
$ bundle install
```

Run migrations and seed the database:
```
$ rake db:create && rake db:migrate && rake db:seed
```
Run the app locally:
```
$ bundle exec rails s
```

## Push to Heroku
```
$ heroku create
$ git push heroku master
$ heroku run rake db:migrate
$ heroku run rake db:seed
$ heroku open
```

## MIT License

"MIT License":http://www.opensource.org/licenses/mit-license

Based off of: [Rails Bootstrap](https://github.com/RailsApps/rails-bootstrap/) by Daniel Kehoe
