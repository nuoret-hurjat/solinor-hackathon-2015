class ResponseBodyApi
  def self.response_body_from(uri)
    HTTParty.get uri
  end
  
  def self.get_headers_from(uri)
    response = ResponseBodyApi.response_body_from(uri)
    response.headers
  end
  
  #käytetään: ResponseBodyApi.get_header_from("http://google.com")['server']
  
  def self.get_logo_uri(uri)
    responsebody = ResponseBodyApi.response_body_from uri
    body = responsebody.body
    doc = Nokogiri::HTML(body)
    images = doc.css("img")
    images.map do |img|
      img.attributes['src'].value
    end
  end
end
