module Page
  class API < Grape::API

    version 'v1', sing: :path
    format :json
    prefix :api

    mount Page::V1::Pages

  end
end