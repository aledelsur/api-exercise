class Url < ApplicationRecord
  has_many :tags
  has_many :links

  validates :name, presence: true

  def create_tags_and_links page
    tags = []
    tags << page.css('h1')
    tags << page.css('h2')
    tags << page.css('h3')

    links = page.css('a')

    create_tags(tags.flatten)
    create_links(links)
  end

  private

  def create_tags url_tags
    url_tags.each do |tag|
      tags.create(name: tag.text, tag_type: tag.name)
    end
  end

  def create_links url_links
    url_links.each do |link|
      links.create(name: link[:href])
    end
  end
end
