class GetFromWiki
  def self.get_from_wiki(haku)
    url = "http://dbpedia.org/data/#{haku.capitalize}.json"
    r = RestClient.get url
    h = JSON.parse(r)
    n = Hash.new


    
    h["http://dbpedia.org/resource/#{haku.capitalize}"]["http://dbpedia.org/ontology/abstract"].each do |j|
      if j.to_h["lang"] == "en"
        n=j.to_h
      end
    end
    n["value"]
  end
end
