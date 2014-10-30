### Roomorama API

Wrapper which allows in easy way to make a http call to Roomorama API

## RoomoramaApi::Client

#### Setup

In order to pass credentials about partner's user we can use
 #setup method

```ruby
  client = RoomoramaApi::Client.setup do |config|
    config.client_id     = 7
    config.client_secret = 'fake_client_secret'
    config.token         = 'fake_authentication_token'
  end
```


#### OAuth::AccessToken

Client object allows us to get OAuth::AccessToken, authenticated with passed during configuration credentials.

```ruby
  auth_token = client.auth_token
  auth_token.post("/v1.0/me.json")

  auth.post(create_room_url)
```
