class ResponseBodyApi
  def self.response_body_from(uri)
    HTTParty.get uri
  end
  
  def self.get_headers_from(uri)
    response = ResponseBodyApi.response_body_from(uri)
    response.headers
  end
  
  #käytetään: ResponseBodyApi.get_header_from("http://google.com")['server']
end
