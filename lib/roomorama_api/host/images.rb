module RoomoramaApi
  module Host
    module Images

      # Returns the images assigned to the room specified
      #
      # @example
      #   client.get_image({room_id: 123456})
      #
      # @return array of image representations
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
      # @return the image representation
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
      # @example uploads an image encoded using base64 (uploads using 'data' attribute are always synchronous)
      #   client.create_image({
      #     room_id: 123456,
      #     data: "...base64string...",
      #     caption: "image uploaded in base64"
      #   })
      #
      # @example uploads an image providing the image URL synchronously
      #   client.create_image({
      #     room_id: 123456,
      #     image_url: "http://www.example.com/image.png"
      #   })
      #
      # @example uploads an image providing the image URL asynchronously
      #   client.create_image({
      #     room_id: 123456,
      #     image_url: "http://www.example.com/image.png",
      #     async_upload: true
      #   })
      #
      # @return the image representation when the image is uploaded synchronously
      #   {
      #     "id"=>2231212,
      #     "url"=>"missing/room-image-processing-search_result.png",
      #     "styles"=>{
      #       "large"=>"missing/room-image-processing-gallery.png",
      #       "medium"=>"missing/room-image-processing-medium.png",
      #       "small"=>"missing/room-image-processing-small.png"
      #     },
      #     "position"=>8,
      #     "created_at"=>"2014-11-06 06:00:59",
      #     "updated_at"=>"2014-11-06 06:00:59"
      #   }
      #
      # @return true when the image is uploaded asynchronously
      #   true
      def create_image(image_hash)
        auth_post(host_images_url(image_hash), image_hash)
      end

      # Updates an image
      #
      # @example
      #   client.update_image({room_id: 123456, id: 1234, caption: "New caption"})
      #
      # @return the image representation
      #   {
      #     "id"=>1234,
      #     "url"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_search_result.jpg",
      #     "styles"=>{
      #       "large"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_gallery.jpg",
      #       "medium"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_medium.jpg",
      #       "small"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_small.jpg"
      #     },
      #     "caption"=>"New caption",
      #     "position"=>1,
      #     "created_at"=>"2014-10-22 06:33:59",
      #     "updated_at"=>"2014-10-22 10:32:56"
      #   }
      def update_image(image_hash)
        auth_put(host_image_url(image_hash), image_hash)
      end

      # Reorders images
      #
      # @example
      #   client.reorder_images({room_id: 193117, images:[1235,1234]})
      #
      # @example
      #   client.reorder_images({room_id: 193117, images:"1235,1234"})
      #
      # @return array of image representations
      #   [
      #     {
      #       "id"=>1235,
      #       "url"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230038/2230038_search_result.jpg",
      #       "styles"=>{
      #         "large"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230038/2230038_gallery.jpg",
      #         "medium"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230038/2230038_medium.jpg",
      #         "small"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230038/2230038_small.jpg"},
      #       "position"=>1,
      #       "created_at"=>"2014-10-22 10:35:23",
      #       "updated_at"=>"2014-10-22 10:35:50"
      #     }
      #     {
      #       "id"=>1234,
      #       "url"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_search_result.jpg",
      #       "styles"=>{
      #         "large"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_gallery.jpg",
      #         "medium"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_medium.jpg",
      #         "small"=>"https://staging-assets.roomorama-cache.com/photos/rooms/2230036/2230036_small.jpg"
      #       },
      #       "caption"=>"Example caption",
      #       "position"=>2,
      #       "created_at"=>"2014-10-22 06:33:59",
      #       "updated_at"=>"2014-10-22 10:32:56"
      #     }
      #   ]
      def reorder_images(order_hash)
        auth_put(host_images_url(order_hash), order_hash)
      end

    end
  end
end
