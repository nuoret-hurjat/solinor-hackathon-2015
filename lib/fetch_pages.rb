class FetchPages
  def self.get_url_from_file_and_crawl(file)
    IO.foreach(file) do |line|
      rivi = line.gsub("\n", '').squeeze(' ')
      url = "http://#{rivi}"
      logo = GetImagesApi.get_images_mechanize(url)
      logo = "tyhjä" if logo.nil?
      techs = WappalyzerRb::Detector.new(url).analysis
      urli = Domainatrix.parse(url)
      if not Company.find_by name:urli.domain
        firma = Company.create name:urli.domain, logo:logo, url:url, admin_edited:false
      else
        firma = Company.find_by name:urli.domain
      end
      techs.each do |t|
        tech = Technology.find_by name:t
        firma.technologies << tech unless firma.technologies.include?(tech)
      end
    end
  end
end