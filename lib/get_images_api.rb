class GetImagesApi
  def self.get_images_from(url)

    page = Nokogiri::HTML(RestClient.get(url))
    url = "#{url}/" if url[-1, 1] != '/'
    url = "http://#{url}" if not url.include?("http") and not url.include?("https")
    images = page.xpath('//img')
    set = Array.new
    images.each do |i|
      if i.to_h["src"]
        src = i.to_h["src"]
      elsif i.to_h["data-src"]
        src = i.to_h["data-src"]
      end

      if src and src.include?('http')
        set << "#{i.to_h["src"]}"
      else
        set << "#{url}#{i.to_h["src"]}"
      end
    end

    set
  end

  def self.get_images_mechanize(url)
    agent = Mechanize.new
    doc = agent.get(url)
    agent.get(doc.parser.at('img')['src'])
    urli = Domainatrix.parse(url)
    img = doc.images_with(:src => urli)
    img = doc.images_with(:src => /logo/) if img.empty?
    img.last.fetch

  end
end
