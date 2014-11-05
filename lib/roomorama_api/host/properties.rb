module RoomoramaApi
  module Host
    module Properties

      def get_properties
        auth_get(host_properties_url)
      end

      def get_property(property_hash)
        property_url = host_property_url(property_hash)
        auth_get(property_url)
      end

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
