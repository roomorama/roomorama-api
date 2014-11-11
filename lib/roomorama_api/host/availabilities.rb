module RoomoramaApi
  module Host
    module Availabilities

      # Returns availability and price information for the room specified
      #
      # @example returns availability information from 2014-10-04 to 2014-10-05
      #   client.get_availabilities({room_id: 123456, start_date: '2014-10-04', end_date: '2014-10-05'})
      #
      # @example returns availability information for 1 year ahead
      #   client.get_availabilities({room_id: 123456})
      #
      # @return
      #   [
      #     {
      #       "date"=>"2014-10-04",
      #       "available"=>true,
      #       "currency_code"=>"USD",
      #       "nightly_rate"=>200,
      #       "weekly_rate"=>1500,
      #       "monthly_rate"=>4500,
      #       "can_checkin"=>true,
      #       "can_checkout"=>true,
      #       "minimum_stay"=>2,
      #       "default"=>false,
      #       "inquiry_id"=>"null"
      #     },
      #     {
      #       "date"=>"2014-10-05",
      #       "available"=>true,
      #       "currency_code"=>"USD",
      #       "nightly_rate"=>200,
      #       "weekly_rate"=>1500,
      #       "monthly_rate"=>4500,
      #       "can_checkin"=>true,
      #       "can_checkout"=>true,
      #       "minimum_stay"=>2,
      #       "default"=>false,
      #       "inquiry_id"=>"null"
      #     }
      #   ]
      #
      def get_availabilities(selection_hash)
        auth_get(host_availabilities_url(selection_hash), selection_hash)['availabilities']
      end


      # Updates availability and price information for the room specified
      #
      # @example updates availabilities from 2014-10-04 to 2014-10-05
      #   client.update_availabilities({
      #     room_id: 123456,
      #     availabilities: [{
      #       start_date: '2014-10-04',
      #       end_date: '2014-10-05',
      #       available: true,
      #       nightly_rate: 200,
      #       weekly_rate: 1200
      #       monthly_rate: 3500,
      #       can_checkin: true,
      #       can_checkout: true,
      #       minimum_stay: 2
      #     }]
      #   })
      #
      # @example updates a single date and a range
      #   client.update_availabilities({
      #     room_id: 123456,
      #     availabilities: [
      #       {
      #         start_date: '2014-10-04',
      #         end_date: '2014-10-05',
      #         available: true,
      #         nightly_rate: 200,
      #         weekly_rate: 1200
      #         monthly_rate: 3500,
      #         can_checkin: true,
      #         can_checkout: true,
      #         minimum_stay: 2
      #       },
      #       {
      #         date: '2014-10-06',
      #         available: true,
      #         nightly_rate: 250,
      #         weekly_rate: 1400
      #         monthly_rate: 4000,
      #         can_checkin: true,
      #         can_checkout: true,
      #         minimum_stay: 1
      #       }
      #     ]
      #   })
      #
      # @example skips the response. In case the response is not used, it can be skipped and the method will return faster.
      #   client.update_availabilities({
      #     room_id: 123456,
      #     return: :none,
      #     availabilities: [{
      #       start_date: '2014-10-04',
      #       end_date: '2014-10-05',
      #       available: true,
      #       nightly_rate: 200,
      #       weekly_rate: 1200
      #       monthly_rate: 3500,
      #       can_checkin: true,
      #       can_checkout: true,
      #       minimum_stay: 2
      #     }]
      #   })
      #
      # @example returns only the dates that were not updated.
      #   client.update_availabilities({
      #     room_id: 123456,
      #     return: :errors,
      #     availabilities: [{
      #       start_date: '2014-10-04',
      #       end_date: '2014-10-05',
      #       available: true,
      #       nightly_rate: 200,
      #       weekly_rate: 1200
      #       monthly_rate: 3500,
      #       can_checkin: true,
      #       can_checkout: true,
      #       minimum_stay: 2
      #     }]
      #   })
      #
      # @return the availability information updated
      #   [
      #     {
      #       "date"=>"2014-10-04",
      #       "available"=>true,
      #       "currency_code"=>"USD",
      #       "nightly_rate"=>200,
      #       "weekly_rate"=>1200,
      #       "monthly_rate"=>3500,
      #       "can_checkin"=>true,
      #       "can_checkout"=>true,
      #       "minimum_stay"=>2,
      #       "default"=>false,
      #       "inquiry_id"=>"null",
      #       "errors"=>[]
      #     },
      #     {
      #       "date"=>"2014-10-05",
      #       "available"=>true,
      #       "currency_code"=>"USD",
      #       "nightly_rate"=>200,
      #       "weekly_rate"=>1200,
      #       "monthly_rate"=>3500,
      #       "can_checkin"=>true,
      #       "can_checkout"=>true,
      #       "minimum_stay"=>2,
      #       "default"=>false,
      #       "inquiry_id"=>"null",
      #       "errors"=>[]
      #     },
      #     {
      #       "date"=>"2014-10-06",
      #       "available"=>true,
      #       "currency_code"=>"USD",
      #       "nightly_rate"=>250,
      #       "weekly_rate"=>1400,
      #       "monthly_rate"=>4000,
      #       "can_checkin"=>true,
      #       "can_checkout"=>true,
      #       "minimum_stay"=>1,
      #       "default"=>false,
      #       "inquiry_id"=>"null",
      #       "errors"=>[]
      #     }
      #   ]
      def update_availabilities(availabilities_hash)
        response_type = availabilities_hash[:return] || :successes
        url = "#{host_availabilities_url(availabilities_hash)}?return=#{response_type}"
        auth_put(host_availabilities_url(availabilities_hash), availabilities_hash[:availabilities])
      end
    end
  end
end
