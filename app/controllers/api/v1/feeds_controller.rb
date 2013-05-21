module Api
  module V1
    class FeedsController < ApplicationController
      before_filter :require_api_key
      before_filter :find_trip
      respond_to :json

      def show
        trip_feed = TripFeed.new(:trip => @trip)

        if params[:only_text]
          respond_with trip_feed.notes
        else
          respond_with trip_feed.feed
        end
      end

      private

      def find_trip
        @trip = Trip.find(params[:id])
      end

      def require_api_key
        user = User.where(:username => params[:username]).first

        if user
          signature = params[:signature]

          uri = "http://localhost:3000/api/v1/feeds/#{params[:id]}?username=#{params[:username]}&timestamp=#{params[:timestamp]}"
          uri << "&text_only=#{params[:text_only]}" if params[:text_only]

          answer = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new('sha1'), user.api_key.to_s, uri)

# TODO --------------> make sure to check timestamp within X of Time.now.to_i

          # unless answer == signature
          #   respond_with '{"errors":[{"message":"Bad Authentication data","code":215}]}'.to_json
          #   return false
          # end
        end
      end
    end
  end
end
