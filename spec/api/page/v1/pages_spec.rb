require 'rails_helper'

describe Page::V1::Pages do
  context 'Opening a URL to store the H1, H2, H3 and links' do
    context 'when the endpoint is called but no URL is passed in' do
      it 'returns an error' do
        post '/api/v1/pages'
        expect(response.status).to eq 400 # Bad request
      end
    end

    context 'when the endpoint is called with a valid URL' do
      it 'reads the content' do
        post '/api/v1/pages', params: { page_url: 'http://www.twitter.com' }
        expect(response.status).to eq 201 # OK / created
      end
    end
  end

  context 'retrieving the urls, tags and links from the database' do
    let(:url) { Url.create(name: 'http://www.twitter.com') }
    let(:tag_1) { Tag.create(name: 'Tag 1', tag_type: 'h1', url: url) }
    let(:tag_2) { Tag.create(name: 'Tag 2', tag_type: 'h2', url: url) }
    let(:link) { Link.create(name: 'http://www.google.com', url: url) }

    it 'returns to the client the URL and the tags and links associated with it' do
      get '/api/v1/pages', params: { page_url: url.name }
      expect(response.status).to eq 200 # OK
      
      expect(JSON.parse(response.body).first["name"]).to eq(url.name)
    end
  end
end