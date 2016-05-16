module RoomoramaApi
  module Host
    module Properties

      # Returns all the properties of the user
      #
      # @example
      #   client.get_properties
      #
      # @return
      #   [{
      #     "id"=>193117,
      #     "type"=>"house",
      #     "internal_id"=>"",
      #     "subtype"=>"house",
      #     "title"=>"Confortable house in Washington",
      #     "postal_code"=>"20500",
      #     "city"=>"Washington",
      #     "neighborhood"=>"",
      #     "lat"=>"38.89285",
      #     "lng"=>"-77.0250467",
      #     "description"=>
      #       "<span>The White House is the official residence and principal workplace of the President of the United States, located at 1600 Pennsylvania Avenue NW in Wash
      #     "number_of_double_beds"=>10,
      #     "number_of_single_beds"=>10,
      #     "number_of_sofa_beds"=>10,
      #     "surface"=>1000,
      #     "surface_unit"=>"metric",
      #     "amenities"=>[
      #       "bed_linen_and_towels",
      #       "kitchen",
      #       "wifi",
      #       "internet",
      #       "cabletv",
      #       "tv",
      #       "parking",
      #       "airconditioning",
      #       "laundry",
      #       "free_cleaning",
      #       "wheelchairaccess",
      #       "pool",
      #       "gym",
      #       "breakfast",
      #       "elevator",
      #       "doorman",
      #       "balcony",
      #       "outdoor_space"
      #     ],
      #     "max_guests"=>20,
      #     "minimum_stay"=>1,
      #     "check_in_instructions"=>nil,
      #     "address"=>"Pennsylvania Ave NW",
      #     "apartment_number"=>"1600",
      #     "number_of_bedrooms"=>10,
      #     "number_of_bathrooms"=>10.0,
      #     "floor"=>"50+",
      #     "smoking_allowed"=>false,
      #     "pets_allowed"=>false,
      #     "children_welcome"=>false,
      #     "check_in_time"=>"10:00",
      #     "check_out_time"=>"10:00",
      #     "currency_code"=>"USD",
      #     "nightly_rate"=>5000,
      #     "weekly_rate"=>35000,
      #     "monthly_rate"=>150000,
      #     "multi_unit"=>false,
      #     "security_deposit"=>{"amount"=>nil, "type"=>"cash", "currency_code"=>"USD"},
      #     "tax_rate"=>"12.0",
      #     "extra_charges"=>50,
      #     "rate_base_max_guests"=>2,
      #     "extra_guest_surcharge"=>35,
      #     "default_to_available"=>true,
      #     "cancellation_policy"=>nil,
      #     "services"=>{
      #       "cleaning"=>{"available"=>true, "rate"=>"1000", "required"=>true},
      #       "airport_pickup"=>{"available"=>false, "rate"=>nil},
      #       "car_rental"=>{"available"=>false, "rate"=>nil},
      #       "concierge"=>{"available"=>false, "rate"=>nil}
      #     },
      #     "disabled"=>false,
      #     "in_search_results"=>true,
      #     "thumbnail"=>
      #       "https://staging-assets.roomorama-cache.com/photos/rooms/2230038/2230038_search_result.jpg",
      #     "created_at"=>"2014-09-02 08:38:34",
      #     "updated_at"=>"2014-11-11 02:50:12",
      #     "units"=>[],
      #     "destination"=>{
      #       "id"=>278,
      #       "name"=>"Downtown",
      #       "long_name"=>"Downtown, Washington DC",
      #       "url_name"=>"downtown",
      #       "url_path"=>"washington-dc/downtown"
      #     }
      #   }]
      def get_properties
        auth_get(host_properties_url)
      end

      # Returns the room information
      #
      # @example
      #   client.get_property({id: 193117})
      #
      # @return
      #   {
      #     "id"=>193117,
      #     "type"=>"house",
      #     "internal_id"=>"",
      #     "subtype"=>"house",
      #     "title"=>"Confortable house in Washington",
      #     "postal_code"=>"20500",
      #     "city"=>"Washington",
      #     "neighborhood"=>"",
      #     "lat"=>"38.89285",
      #     "lng"=>"-77.0250467",
      #     "description"=>
      #       "<span>The White House is the official residence and principal workplace of the President of the United States, located at 1600 Pennsylvania Avenue NW in Wash
      #     "number_of_double_beds"=>10,
      #     "number_of_single_beds"=>10,
      #     "number_of_sofa_beds"=>10,
      #     "surface"=>1000,
      #     "surface_unit"=>"metric",
      #     "amenities"=>[
      #       "bed_linen_and_towels",
      #       "kitchen",
      #       "wifi",
      #       "internet",
      #       "cabletv",
      #       "tv",
      #       "parking",
      #       "airconditioning",
      #       "laundry",
      #       "free_cleaning",
      #       "wheelchairaccess",
      #       "pool",
      #       "gym",
      #       "breakfast",
      #       "elevator",
      #       "doorman",
      #       "balcony",
      #       "outdoor_space"
      #     ],
      #     "max_guests"=>20,
      #     "minimum_stay"=>1,
      #     "check_in_instructions"=>nil,
      #     "address"=>"Pennsylvania Ave NW",
      #     "apartment_number"=>"1600",
      #     "number_of_bedrooms"=>10,
      #     "number_of_bathrooms"=>10.0,
      #     "floor"=>"50+",
      #     "smoking_allowed"=>false,
      #     "pets_allowed"=>false,
      #     "children_welcome"=>false,
      #     "check_in_time"=>"10:00",
      #     "check_out_time"=>"10:00",
      #     "currency_code"=>"USD",
      #     "nightly_rate"=>5000,
      #     "weekly_rate"=>35000,
      #     "monthly_rate"=>150000,
      #     "multi_unit"=>false,
      #     "security_deposit"=>{"amount"=>nil, "type"=>"cash", "currency_code"=>"USD"},
      #     "tax_rate"=>"12.0",
      #     "extra_charges"=>50,
      #     "rate_base_max_guests"=>2,
      #     "extra_guest_surcharge"=>35,
      #     "default_to_available"=>true,
      #     "cancellation_policy"=>nil,
      #     "services"=>{
      #       "cleaning"=>{"available"=>true, "rate"=>"1000", "required"=>true},
      #       "airport_pickup"=>{"available"=>false, "rate"=>nil},
      #       "car_rental"=>{"available"=>false, "rate"=>nil},
      #       "concierge"=>{"available"=>false, "rate"=>nil}
      #     },
      #     "disabled"=>false,
      #     "in_search_results"=>true,
      #     "thumbnail"=>
      #       "https://staging-assets.roomorama-cache.com/photos/rooms/2230038/2230038_search_result.jpg",
      #     "created_at"=>"2014-09-02 08:38:34",
      #     "updated_at"=>"2014-11-11 02:50:12",
      #     "units"=>[],
      #     "destination"=>{
      #       "id"=>278,
      #       "name"=>"Downtown",
      #       "long_name"=>"Downtown, Washington DC",
      #       "url_name"=>"downtown",
      #       "url_path"=>"washington-dc/downtown"
      #      }
      #   }
      def get_property(property_hash)
        property_url = host_property_url(property_hash)
        auth_get(property_url)
      end

      # Creates a property
      #
      # @example
      #   client.create_property({
      #     type: "apartment",
      #     title: "Test Property",
      #     address: "Amoy Street",
      #     apartment_number: "115",
      #     postal_code: "069935",
      #     city: "Singapore",
      #     neighborhood: "Chinatown",
      #     country_code: "SG",
      #     description: "Test property",
      #     number_of_bedrooms: 1,
      #     number_of_bathrooms: "1",
      #     floor: "2",
      #     number_of_double_beds: 1,
      #     number_of_single_beds: 2,
      #     number_of_sofa_beds: 1,
      #     surface: 300,
      #     surface_unit: "metric",
      #     amenities: "bed_linen_and_towels,kitchen,wifi,cabletv,airconditioning,pool,gym",
      #     max_guests: 5,
      #     minimum_stay: 2,
      #     multi_unit: false,
      #     smoking_allowed: false,
      #     pets_allowed: true,
      #     children_welcome: true,
      #     check_in_instructions: "Just ring the bell",
      #     check_in_time: "13:00",
      #     check_out_time: "11:00",
      #     currency_code: "USD",
      #     nightly_rate: 50,
      #     weekly_rate: 350,
      #     monthly_rate: 1500,
      #     security_deposit_amount: 100,
      #     security_deposit_type: "cash",
      #     security_deposit_currency_code: "USD",
      #     tax_rate: 2.5,
      #     extra_charges: 10,
      #     rate_base_max_guests: 2,
      #     extra_guest_surcharge: 10,
      #     default_to_available: true,
      #     cancellation_policy: "One week before",
      #     services_cleaning: true,
      #     services_cleaning_rate: "25",
      #     services_cleaning_required: false,
      #     services_airport_pickup: true,
      #     services_airport_pickup_rate: "15",
      #     services_car_rental: true,
      #     services_car_rental_rate: "150",
      #     services_concierge: true,
      #     services_concierge_rate: "50",
      #     disabled: false
      #   })
      #
      # @return
      #   {
      #     "id"=>193636,
      #     "type"=>"apartment",
      #     "internal_id"=>nil,
      #     "subtype"=>nil,
      #     "title"=>"Test Property",
      #     "postal_code"=>"069935",
      #     "city"=>"Singapore",
      #     "neighborhood"=>"Chinatown",
      #     "lat"=>"1.2820967",
      #     "lng"=>"103.8480255",
      #     "description"=>"Test property",
      #     "number_of_double_beds"=>1,
      #     "number_of_single_beds"=>2,
      #     "number_of_sofa_beds"=>1,
      #     "surface"=>300,
      #     "surface_unit"=>"metric",
      #     "amenities"=>[
      #       "bed_linen_and_towels",
      #       "kitchen",
      #       "wifi",
      #       "cabletv",
      #       "airconditioning",
      #       "pool",
      #       "gym"
      #     ],
      #     "max_guests"=>5,
      #     "minimum_stay"=>2,
      #     "check_in_instructions"=>"Just ring the bell",
      #     "address"=>"Amoy Street",
      #     "apartment_number"=>"115",
      #     "number_of_bedrooms"=>1,
      #     "number_of_bathrooms"=>1.0,
      #     "floor"=>"2",
      #     "smoking_allowed"=>false,
      #     "pets_allowed"=>true,
      #     "children_welcome"=>true,
      #     "check_in_time"=>"13:00",
      #     "check_out_time"=>"11:00",
      #     "currency_code"=>"USD",
      #     "nightly_rate"=>50,
      #     "weekly_rate"=>350,
      #     "monthly_rate"=>1500,
      #     "multi_unit"=>false,
      #     "security_deposit"=>{"amount"=>100, "type"=>"cash", "currency_code"=>"USD"},
      #     "tax_rate"=>"2.5",
      #     "extra_charges"=>10,
      #     "rate_base_max_guests"=>2,
      #     "extra_guest_surcharge"=>10,
      #     "default_to_available"=>true,
      #     "cancellation_policy"=>nil,
      #     "terms_and_conditions"=>nil,
      #     "services"=>{
      #       "cleaning"=>{"available"=>true, "rate"=>"25", "required"=>false},
      #       "airport_pickup"=>{"available"=>true, "rate"=>"15"},
      #       "car_rental"=>{"available"=>true, "rate"=>"150"},
      #       "concierge"=>{"available"=>true, "rate"=>"50"}
      #     },
      #     "disabled"=>false,
      #     "in_search_results"=>false,
      #     "thumbnail"=>nil,
      #     "created_at"=>"2014-11-11 03:42:15",
      #     "updated_at"=>"2014-11-11 03:42:15",
      #     "units"=>[],
      #     "destination"=>{
      #       "id"=>6938,
      #       "name"=>"Outram",
      #       "long_name"=>"Outram, Singapore",
      #       "url_name"=>"outram",
      #       "url_path"=>"singapore/outram"
      #     }
      #   }
      def create_property(property_hash)
        auth_post(host_properties_url, property_hash)
      end

      # Updates a property
      #
      # @example
      #   client.update_property({
      #     id: 193636,
      #     type: "apartment",
      #     title: "Test Property",
      #     address: "Amoy Street",
      #     apartment_number: "115",
      #     postal_code: "069935",
      #     city: "Singapore",
      #     neighborhood: "Chinatown",
      #     country_code: "SG",
      #     description: "Test property (updated)",
      #     number_of_bedrooms: 2,
      #     number_of_bathrooms: "2",
      #     floor: "3",
      #     number_of_double_beds: 2,
      #     number_of_single_beds: 1,
      #     number_of_sofa_beds: 2,
      #     surface: 301,
      #     surface_unit: "metric",
      #     amenities: "bed_linen_and_towels,kitchen,wifi,cabletv,airconditioning,pool,breakfast",
      #     max_guests: 5,
      #     minimum_stay: 2,
      #     multi_unit: false,
      #     smoking_allowed: false,
      #     pets_allowed: true,
      #     children_welcome: true,
      #     check_in_instructions: "Just ring the bell (updated)",
      #     check_in_time: "13:01",
      #     check_out_time: "11:01",
      #     currency_code: "USD",
      #     nightly_rate: 51,
      #     weekly_rate: 351,
      #     monthly_rate: 1501,
      #     security_deposit_amount: 101,
      #     security_deposit_type: "cash",
      #     security_deposit_currency_code: "USD",
      #     tax_rate: 2.6,
      #     extra_charges: 11,
      #     rate_base_max_guests: 3,
      #     extra_guest_surcharge: 11,
      #     default_to_available: true,
      #     cancellation_policy: "One week before (updated)",
      #     services_cleaning: true,
      #     services_cleaning_rate: "26",
      #     services_cleaning_required: false,
      #     services_airport_pickup: true,
      #     services_airport_pickup_rate: "16",
      #     services_car_rental: true,
      #     services_car_rental_rate: "151",
      #     services_concierge: true,
      #     services_concierge_rate: "50",
      #     disabled: false
      #   })
      #
      # @return
      #   {
      #     "id"=>193636,
      #     "type"=>"apartment",
      #     "internal_id"=>nil,
      #     "subtype"=>nil,
      #     "title"=>"Test Property",
      #     "postal_code"=>"069935",
      #     "city"=>"Singapore",
      #     "neighborhood"=>"Chinatown",
      #     "lat"=>"1.2820967",
      #     "lng"=>"103.8480255",
      #     "description"=>"Test property (updated)",
      #     "number_of_double_beds"=>2,
      #     "number_of_single_beds"=>1,
      #     "number_of_sofa_beds"=>2,
      #     "surface"=>301,
      #     "surface_unit"=>"metric",
      #     "amenities"=>[
      #       "bed_linen_and_towels",
      #       "kitchen",
      #       "wifi",
      #       "cabletv",
      #       "airconditioning",
      #       "pool",
      #       "breakfast"
      #     ],
      #     "max_guests"=>5,
      #     "minimum_stay"=>2,
      #     "check_in_instructions"=>"Just ring the bell (udpated)",
      #     "address"=>"Amoy Street",
      #     "apartment_number"=>"115",
      #     "number_of_bedrooms"=>2,
      #     "number_of_bathrooms"=>2.0,
      #     "floor"=>"3",
      #     "smoking_allowed"=>false,
      #     "pets_allowed"=>true,
      #     "children_welcome"=>true,
      #     "check_in_time"=>"13:01",
      #     "check_out_time"=>"11:01",
      #     "currency_code"=>"USD",
      #     "nightly_rate"=>51,
      #     "weekly_rate"=>351,
      #     "monthly_rate"=>1501,
      #     "multi_unit"=>false,
      #     "security_deposit"=>{"amount"=>101, "type"=>"cash", "currency_code"=>"USD"},
      #     "tax_rate"=>"2.6",
      #     "extra_charges"=>11,
      #     "rate_base_max_guests"=>3,
      #     "extra_guest_surcharge"=>11,
      #     "default_to_available"=>true,
      #     "cancellation_policy"=>nil,
      #     "terms_and_conditions"=>nil,
      #     "services"=>{
      #       "cleaning"=>{"available"=>true, "rate"=>"26", "required"=>false},
      #       "airport_pickup"=>{"available"=>true, "rate"=>"16"},
      #       "car_rental"=>{"available"=>true, "rate"=>"151"},
      #       "concierge"=>{"available"=>true, "rate"=>"50"}
      #     },
      #     "disabled"=>false,
      #     "in_search_results"=>false,
      #     "thumbnail"=>nil,
      #     "created_at"=>"2014-11-11 03:42:15",
      #     "updated_at"=>"2014-11-11 04:02:48",
      #     "units"=>[],
      #     "destination"=>{
      #       "id"=>6938,
      #       "name"=>"Outram",
      #       "long_name"=>"Outram, Singapore",
      #       "url_name"=>"outram",
      #       "url_path"=>"singapore/outram"
      #     }
      #   }
      def update_property(property_hash)
        auth_put(host_property_url(property_hash), property_hash)
      end

      # Sets a property as instantly available
      #
      # @example
      #   client.set_instantly_available({
      #     room_id: 193636,
      #     instantly_available: true
      #   })
      #
      # @return
      #   {
      #     "id"=>193636,
      #     "instant_booking"=>true
      #   }
      def set_instantly_available(property_hash)
        instantly_available = property_hash.fetch(:instantly_available)
        url = host_property_url(property_hash)
        data = property_hash
        data = data.merge(instant_booking: !!instantly_available)

        auth_put(url, data)
      end

      # Returns the units for a specified room
      #
      # @example
      #   client.get_units({room_id: 193637})
      #
      # @return
      #   [{
      #     "id"=>19000,
      #     "title"=>"Test unit",
      #     "description"=>"This is a test unit",
      #     "number_of_units"=>5,
      #     "internal_id"=>nil,
      #     "position"=>1,
      #     "number_of_rooms"=>2,
      #     "max_guests"=>5,
      #     "minimum_stay"=>2,
      #     "type"=>"apartment",
      #     "subtype"=>nil,
      #     "extra_guest_surcharge"=>15,
      #     "smokingallowed"=>false,
      #     "petsallowed"=>true,
      #     "childrenwelcome"=>true,
      #     "floor"=>"4",
      #     "number_of_bathrooms"=>"2",
      #     "number_of_double_beds"=>1,
      #     "number_of_single_beds"=>2,
      #     "number_of_sofa_beds"=>1,
      #     "surface"=>200,
      #     "amenities"=>[
      #       "bed_linen_and_towels",
      #       "kitchen",
      #       "wifi",
      #       "cabletv",
      #       "airconditioning",
      #       "pool",
      #       "gym"
      #     ],
      #     "disabled"=>false,
      #     "hidden"=>false,
      #     "nightly_rate"=>50,
      #     "weekly_rate"=>350,
      #     "monthly_rate"=>1500,
      #     "updated_at"=>"2014-11-11 06:22:46",
      #     "created_at"=>"2014-11-11 06:22:46"
      #   }]

      def get_units(property_hash)
        auth_get(host_units_url(property_hash))
      end

      # Returns the unit information
      #
      # @example
      #   client.get_unit({room_id: 193637, id: 19000})
      #
      # @return
      #   {
      #     "id"=>19000,
      #     "title"=>"Test unit",
      #     "description"=>"This is a test unit",
      #     "number_of_units"=>5,
      #     "internal_id"=>nil,
      #     "position"=>1,
      #     "number_of_rooms"=>2,
      #     "max_guests"=>5,
      #     "minimum_stay"=>2,
      #     "type"=>"apartment",
      #     "subtype"=>nil,
      #     "extra_guest_surcharge"=>15,
      #     "smokingallowed"=>false,
      #     "petsallowed"=>true,
      #     "childrenwelcome"=>true,
      #     "floor"=>"4",
      #     "number_of_bathrooms"=>"2",
      #     "number_of_double_beds"=>1,
      #     "number_of_single_beds"=>2,
      #     "number_of_sofa_beds"=>1,
      #     "surface"=>200,
      #     "amenities"=>[
      #       "bed_linen_and_towels",
      #       "kitchen",
      #       "wifi",
      #       "cabletv",
      #       "airconditioning",
      #       "pool",
      #       "gym"
      #     ],
      #     "disabled"=>false,
      #     "hidden"=>false,
      #     "nightly_rate"=>50,
      #     "weekly_rate"=>350,
      #     "monthly_rate"=>1500,
      #     "updated_at"=>"2014-11-11 06:22:46",
      #     "created_at"=>"2014-11-11 06:22:46"
      #   }

      def get_unit(property_unit_hash)
        auth_get(host_unit_url(property_unit_hash))
      end

      # Creates a unit in a specified room (the room provided must be a multi-unit room)
      #
      # @example
      #   client.create_unit({
      #     room_id: 193637,
      #     title: "Test unit",
      #     nightly_rate: 50,
      #     weekly_rate: 350,
      #     monthly_rate: 1500,
      #     number_of_rooms: 2,
      #     number_of_units: 5,
      #     type: "apartment",
      #     description: "This is a test unit",
      #     number_of_bathrooms: "2",
      #     floor: "4",
      #     number_of_double_beds: 1,
      #     number_of_single_beds: 2,
      #     number_of_sofa_beds: 1,
      #     surface: 200,
      #     amenities: "bed_linen_and_towels,kitchen,wifi,cabletv,airconditioning,pool,gym",
      #     max_guests: 5,
      #     minimum_stay: 2,
      #     smokingallowed: false,
      #     petsallowed: true,
      #     childrenwelcome: true,
      #     tax_rate: 2.5,
      #     extra_guest_surcharge: 15,
      #     disabled: false
      #   })
      #
      # @return
      #   {
      #     "id"=>19000,
      #     "title"=>"Test unit",
      #     "description"=>"This is a test unit",
      #     "number_of_units"=>5,
      #     "internal_id"=>nil,
      #     "position"=>1,
      #     "number_of_rooms"=>2,
      #     "max_guests"=>5,
      #     "minimum_stay"=>2,
      #     "type"=>"apartment",
      #     "subtype"=>nil,
      #     "extra_guest_surcharge"=>15,
      #     "smokingallowed"=>false,
      #     "petsallowed"=>true,
      #     "childrenwelcome"=>true,
      #     "floor"=>"4",
      #     "number_of_bathrooms"=>"2",
      #     "number_of_double_beds"=>1,
      #     "number_of_single_beds"=>2,
      #     "number_of_sofa_beds"=>1,
      #     "surface"=>200,
      #     "amenities"=>[
      #       "bed_linen_and_towels",
      #       "kitchen",
      #       "wifi",
      #       "cabletv",
      #       "airconditioning",
      #       "pool",
      #       "gym"
      #     ],
      #     "disabled"=>false,
      #     "hidden"=>false,
      #     "nightly_rate"=>50,
      #     "weekly_rate"=>350,
      #     "monthly_rate"=>1500,
      #     "updated_at"=>"2014-11-11 06:22:46",
      #     "created_at"=>"2014-11-11 06:22:46"
      #   }
      def create_unit(unit_hash)
        auth_post(host_units_url(unit_hash), unit_hash)
      end

     # Creates a unit in a specified room (the room provided must be a multi-unit room)
      #
      # @example
      #   client.update_unit({
      #     room_id: 193637,
      #     id: 19000,
      #     title: "Test unit (updated)",
      #     nightly_rate: 51,
      #     weekly_rate: 351,
      #     monthly_rate: 1501,
      #     number_of_rooms: 3,
      #     number_of_units: 4,
      #     type: "apartment",
      #     description: "This is a test unit (updated)",
      #     number_of_bathrooms: "1",
      #     floor: "3",
      #     number_of_double_beds: 2,
      #     number_of_single_beds: 1,
      #     number_of_sofa_beds: 2,
      #     surface: 201,
      #     amenities: "bed_linen_and_towels,kitchen,wifi,cabletv,airconditioning,pool,breakfast",
      #     max_guests: 6,
      #     minimum_stay: 1,
      #     smokingallowed: true,
      #     petsallowed: true,
      #     childrenwelcome: true,
      #     tax_rate: 2.6,
      #     extra_guest_surcharge: 16,
      #     disabled: false
      #   })
      #
      # @return
      #   {
      #     "id"=>19000,
      #     "title"=>"Test unit (updated)",
      #     "description"=>"This is a test unit (updated)",
      #     "number_of_units"=>4,
      #     "internal_id"=>nil,
      #     "position"=>1,
      #     "number_of_rooms"=>3,
      #     "max_guests"=>6,
      #     "minimum_stay"=>1,
      #     "type"=>"apartment",
      #     "subtype"=>nil,
      #     "extra_guest_surcharge"=>16,
      #     "smokingallowed"=>true,
      #     "petsallowed"=>true,
      #     "childrenwelcome"=>true,
      #     "floor"=>"3",
      #     "number_of_bathrooms"=>"1",
      #     "number_of_double_beds"=>2,
      #     "number_of_single_beds"=>1,
      #     "number_of_sofa_beds"=>2,
      #     "surface"=>201,
      #     "amenities"=>[
      #       "bed_linen_and_towels",
      #       "kitchen",
      #       "wifi",
      #       "cabletv",
      #       "airconditioning",
      #       "pool",
      #       "breakfast"
      #     ],
      #     "disabled"=>false,
      #     "hidden"=>false,
      #     "nightly_rate"=>51,
      #     "weekly_rate"=>351,
      #     "monthly_rate"=>1501,
      #     "updated_at"=>"2014-11-11 06:47:30",
      #     "created_at"=>"2014-11-11 06:22:46"
      #   }
      def update_unit(property_unit_hash)
        auth_put(host_unit_url(property_unit_hash), property_unit_hash)
      end

    end
  end
end
