# Roomorama API

Ruby wrapper library to consume Roomorama's [API 1.0](https://www.roomorama.com/api/v1_0)

## Usage

```ruby
client = RoomoramaApi::Client.setup { |config| config.token = 'Your OAuth token' }
```

## Covered methods

### Properties

```ruby
client.get_properties
client.get_property(property_hash)
client.create_property(property_hash)
client.update_property(property_hash)
client.get_units(property_hash)
client.get_unit(property_unit_hash)
client.create_unit(unit_hash)
client.update_unit(property_unit_hash)
```
### Availabilities

```ruby
client.get_availabilities(selection_hash)
client.update_availabilities(availabilities_hash)
```

### Images

```ruby
client.get_images(room_hash)
client.get_image(image_hash)
client.create_image(image_hash)
client.update_image(image_hash)
client.reorder_images(order_hash)
```