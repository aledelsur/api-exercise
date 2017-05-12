module Page
  module V1
    module Entities
      class PageUrl < Grape::Entity
        # This entity defines the attributes that will be included in the response sent to the client
        format_with(:iso_timestamp) { |dt| dt.iso8601 }

        expose :id
        expose :name
        expose :tags, with: Page::V1::Entities::Tag
        expose :links, with: Page::V1::Entities::Link
      end
    end
  end
end