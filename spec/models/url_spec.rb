require 'rails_helper'

RSpec.describe Url, type: :model do
  describe "Associations" do
    it { should have_many :tags }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end

  describe "Private methods" do
    context "#create_tags" do
      let (:url) { Url.create(name: 'http://www.twitter.com') }

      it "creates tags in the database" do
        fake_tags = Nokogiri::HTML(open('http://www.twitter.com')).css('h2')
        url.send(:create_tags, fake_tags)
        
        expect(Tag.all.size).to eq 4
        expect(Tag.first.name).to eq "¿Qué está pasando?" # it means What's going on? => Learning a little bit of spanish :)
      end
    end

    context "#create_links" do
      let (:url) { Url.create(name: 'http://www.twitter.com') }

      it "creates links in the database" do
        fake_links = Nokogiri::HTML(open('http://www.twitter.com')).css('a')
        url.send(:create_links, fake_links)
        
        expect(Link.all.size).to be > 100
      end
    end    
  end
end