module RoomoramaApi
  module Host
    module Images

      def get_images(room_hash)
        auth_get(host_images_url(room_hash))
      end

      def get_image(image_hash)
        auth_get(host_image_url(image_hash))
      end

      def create_image
      end

      def update_image
      end

      def reorder_images
      end

    end
  end
end
