module Page
  module V1
    module Entities
      class Tag < Grape::Entity
        # This entity defines the attributes that will be included in the response sent to the client
        format_with(:iso_timestamp) { |dt| dt.iso8601 }

        expose :id
        expose :name
        expose :tag_type
      end
    end
  end
end