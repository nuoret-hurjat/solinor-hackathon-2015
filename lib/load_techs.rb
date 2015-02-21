class LoadTechs
  def self.read_json_techs(url)
    response = HTTParty.get(url)
    json = JSON.parse(response.body)
  end

  def self.lue_json
    url = "https://raw.githubusercontent.com/ElbertF/Wappalyzer/master/src/apps.json"
    logo_url = "https://raw.githubusercontent.com/ElbertF/Wappalyzer/master/src/icons/"
    haku = read_json_techs(url)
    haku["apps"].each do |k|
      Technology.create name:k[0], url:k[1]["website"], logo:"#{logo_url}#{k[0]}.png"
    end
  end
end
