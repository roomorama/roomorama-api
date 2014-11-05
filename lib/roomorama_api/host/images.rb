module RoomoramaApi
  module Host
    module Images

      # Returns the images assigned to the room specified
      #
      # @example
      #   client.get_image({room_id: 123456})
      #
      # @return array with the images the room has assigned
      #   [
      #     {
      #       "id"=>1234,
      #       "url"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_search_result.jpg",
      #       "styles"=>{
      #         "large"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_gallery.jpg",
      #         "medium"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_medium.jpg",
      #         "small"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_small.jpg"
      #       },
      #       "caption"=>"Example caption",
      #       "position"=>1,
      #       "created_at"=>"2014-10-22 06:33:59",
      #       "updated_at"=>"2014-10-22 10:32:56"
      #     },
      #     {
      #       "id"=>1235,
      #       "url"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230038/2230038_search_result.jpg",
      #       "styles"=>{
      #         "large"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230038/2230038_gallery.jpg",
      #         "medium"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230038/2230038_medium.jpg",
      #         "small"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230038/2230038_small.jpg"},
      #       "position"=>2,
      #       "created_at"=>"2014-10-22 10:35:23",
      #       "updated_at"=>"2014-10-22 10:35:50"
      #     }
      #   ]
      def get_images(room_hash)
        auth_get(host_images_url(room_hash))
      end

      # Returns the image specified
      #
      # @example
      #   client.get_image({room_id: 123456, id: 1234})
      #
      # @return the image information
      #   {
      #     "id"=>1234,
      #     "url"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_search_result.jpg",
      #     "styles"=>{
      #       "large"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_gallery.jpg",
      #       "medium"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_medium.jpg",
      #       "small"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_small.jpg"
      #     },
      #     "caption"=>"Example caption",
      #     "position"=>1,
      #     "created_at"=>"2014-10-22 06:33:59",
      #     "updated_at"=>"2014-10-22 10:32:56"
      #   }
      def get_image(image_hash)
        auth_get(host_image_url(image_hash))
      end

      # Uploads a new image
      #
      # @example uploads image in base64
      #   {
      #     room_id: 123456,
      #     data: "...base64string...",
      #     caption: "image uploaded in base64"
      #   }
      #
      # @return
      #
      def create_image(image_hash)
        auth_post(host_images_url(image_hash), image_hash)
      end

      def update_image(image_hash)
        auth_put(host_image_url(image_hash), image_hash)
      end

      def reorder_images(order_hash)
        auth_put(host_images_url(order_hash), order_hash[:order])
      end

    end
  end
end
