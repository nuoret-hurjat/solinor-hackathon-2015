class LoadTechs
  def self.read_json_techs(url)
    response = HTTParty.get(url)
    json = JSON.parse(response.body)
  end

  def self.lue_json
    url = "https://raw.githubusercontent.com/ElbertF/Wappalyzer/master/share/apps.json"
    haku = read_json_techs(url)
    haku["apps"].each do |k|
      Technology.create name:k[0], url:k[1]["website"]
      Thread.sleep(10)
    end
  end
end