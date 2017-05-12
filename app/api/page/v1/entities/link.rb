module Page
  module V1
    module Entities
      class Link < Grape::Entity
        # This entity defines the attributes that will be included in the response sent to the client
        format_with(:iso_timestamp) { |dt| dt.iso8601 }

        expose :id
        expose :name
      end
    end
  end
end