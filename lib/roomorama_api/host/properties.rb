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

      def update_property(property_hash)
        property_url = host_property_url(property_hash)
        auth_put(property_url, property_hash)
      end

    end
  end
end
