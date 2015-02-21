class FetchPages
  def self.get_url_from_file_and_crawl(file)
    IO.foreach(file) do |line|
      begin
        status = Timeout::timeout(2) {

          rivi = line.gsub("\n", '').squeeze(' ')
          url = URI::encode("http://#{rivi}")
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

        }
      rescue
        puts("APUA")
      end
    end
  end
end