module Airbnb
  class V2::Listings < Base
    class << self
      ##
      # URL: https://api.airbnb.com/v2/listings/:id
      # Params: 
      #  [Required] client_id:
      #  [Required] _format:
      # Response:
      # {
      #   search_results: [
      #     {
      #       listing: {},
      #       pricing_quote: {},
      #       viewed_at: null
      #     }    
      #   ]
      # }
      ##
      def show(id, query={})
        params = { _format: 'v1_legacy_for_p3', client_id: client_id }
        response = HTTP.get("#{Airbnb::V2::URL}/listings/#{id}", params: params)
        JSON.parse(response.to_str)
      end
      
      ##
      # URL: https://api.airbnb.com/v2/search_results
      # Params: 
      #  [Required] client_id:
      # Response:
      # {
      #   search_results: [
      #     {
      #       listing: {},
      #       pricing_quote: {},
      #       viewed_at: null
      #     }    
      #   ]
      # }
      ##
      def search(query={})
        params = { client_id: client_id }
        params.merge!(query)
        response = HTTP.get("#{Airbnb::V2::URL}/search_results", params: params)
        JSON.parse(response.to_str)
      end
      
      ##
      # URL: https://api.airbnb.com/v2/reviews
      # Params: 
      #  [Required] client_id:
      #  [Required] role: 'all'
      #  [Required] listing_id:
      # Response:
      # {
      #   reviews: [
      #     {
      #       author: {},
      #       author_id: 152062791,
      #       can_be_edited: false,
      #       comments: "abc", 
      #       created_at: "2018-02-17T22:33:32Z",
      #       id: 235725728,
      #       listing_id: 2056659,
      #       recipient_id: 10457593
      #     }    
      #   ]
      # }
      ##
      def reviews(id, query={})
        params = { client_id: client_id, role: 'all', listing_id: id }
        params.merge!(query)
        response = HTTP.get("#{Airbnb::V2::URL}/reviews", params: params)
        JSON.parse(response.to_str)
      end
    end
  end
end
