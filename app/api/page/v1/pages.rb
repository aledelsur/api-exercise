module Page
  class V1::Pages < Grape::API

    resource :pages do

      # Endpoint 1 - The client makes a POST request specifying a web page like www.google.com and the endpoint will open the web page
      #   and extract all the H1, H2, H3 and links from the web page.
      desc 'Receives a URL and indexes the content of the page'
      params do
        requires :page_url
      end

      post do
        url = Url.create(name: params[:page_url]) # Store the URL coming in from the client

        page = Nokogiri::HTML(open(params[:page_url]))
        url.create_tags_and_links(page)
      end

      # Endpoint 2 - The client makes a GET request and it will retrieve from the database all the URLs stored 
      #   with all the H1, H2, H3 and links associated with it.
      desc 'Retrieves all the H1, H2, H3 tags and links for all the URLs stored in the database'
      get do
        urls = Url.all
        present urls, with: Page::V1::Entities::PageUrl
      end
    end

  end
end