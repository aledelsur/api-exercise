class Tag < ApplicationRecord
  belongs_to :url

  enum tag_type: [:h1, :h2, :h3]
end
