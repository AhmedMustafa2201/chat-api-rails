# chat-api-rails

A simple chat api built on top of rails7.

To run the app, type `docker-compose up`

I've wrote unit test cases for `ApplicationsController` as a quick sample. To run it, you can execute `make unittest_controllers`

You can find a very useful commands on the `Makefile` "for development purposes only"

To navigate to Swagger, you can locally visit http://localhost:3000/api-docs

on `config/environments/development.rb`, you'll find the following hosts list. That's because i'm running my application inside one of my private codespaces. You can remove it if you want
```ruby
  config.hosts = [
    "localhost:3000",
    "vigilant-space-winner-7xpx5qv7vrfrvv-3000.app.github.dev", # For debugging inside codespace
  ]
```