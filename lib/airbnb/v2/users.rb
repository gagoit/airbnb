module Airbnb
  class V2::Users < Base
    class << self
      ##
      # URL: https://api.airbnb.com/v2/users/:id
      # Params: 
      #  [Required] client_id:
      #  [Required] _format:
      # Response:
      # {
      #   user: {
      #     
      #   },
      #   metadata: { }
      # }
      ##
      def show(id, query={})
        params = { _format: 'v1_legacy_show', client_id: client_id }
        params.merge!(query)
        response = HTTP.get("#{Airbnb::V2::URL}/users/#{id}", params: params)
        JSON.parse(response.to_str)
      end
      
      ##
      # Returns information about all the listings a user hosts.
      # URL: https://api.airbnb.com/v2/listings
      # Params: 
      #  [Required] client_id:
      #  user_id: 
      # Response:
      # {
      #   listings: [
      #     {
      #        ...
      #        user: {}
      #     }
      #   ],
      #   metadata: {
      #     listing_count: 1,
      #     record_count: 1
      #   }
      # }
      ##
      def host_listings(id, query={})
        params = { client_id: client_id, user_id: id }
        params.merge!(query)
        response = HTTP.get("#{Airbnb::V2::URL}/listings", params: params)
        JSON.parse(response.to_str)
      end
    end
  end
end
