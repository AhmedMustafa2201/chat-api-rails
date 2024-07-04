# chat-api-rails

A simple chat api built on top of rails7.
## Installation
- type `docker-compose up`
- after the `api` service is up, you can run `make migrate` into another terminal window

I've wrote unit test cases for `ApplicationsController` as a quick sample. To run it, you can execute `make unittest_controllers`

You can find a very useful commands on the `Makefile` "for development purposes only"

To navigate to Swagger, you can locally visit http://localhost:3000/api-docs

## Sample API invocations:
### Application
```
curl -X POST -H "Content-Type: application/json" -d '{"name": "app1"}' http://localhost:3000/applications
```

### Chat
```
curl -X POST -H "Content-Type: application/json" http://localhost:3000/applications/{APP_TOKEN}/chats
```

### Message
Creation
```
curl -X POST -H "Content-Type: application/json" -d '{"content": "Hi John!"}' http://localhost:3000/applications/{APP_TOKEN}/chats/{CHAT_NUIMBER}/messages
```
Searching
Creation
```
curl -X GET -H "Content-Type: application/json" http://localhost:3000/applications/{APP_TOKEN}/chats/{CHAT_NUIMBER}/messages/search/?query={message_str}
```

on `config/environments/development.rb`, you'll find the following hosts list. That's because i'm running my application inside one of my private codespaces. You can remove it if you want
```ruby
  config.hosts = [
    "localhost:3000",
    "vigilant-space-winner-7xpx5qv7vrfrvv-3000.app.github.dev", # For debugging inside codespace
  ]
```
