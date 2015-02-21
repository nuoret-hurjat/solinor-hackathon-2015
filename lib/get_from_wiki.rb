class GetFromWiki
  def self.get_from_wiki(haku)
    url = URI::encode("http://dbpedia.org/data/#{haku.capitalize}.json")
    r = RestClient.get url
    h = JSON.parse(r)
    return nil if h.size == 0
    unless h[URI::encode("http://dbpedia.org/resource/#{haku.capitalize}")]["http://dbpedia.org/ontology/abstract"].nil?
      puts h
      puts h.size
      puts h[URI::encode("http://dbpedia.org/resource/#{haku.capitalize}")]["http://dbpedia.org/ontology/abstract"]
      n = Hash.new

      h[URI::encode("http://dbpedia.org/resource/#{haku.capitalize}")]["http://dbpedia.org/ontology/abstract"].each do |j|
        if j.to_h["lang"] == "en"
          n=j.to_h
        end
      end
      n["value"]
    else
      return nil
    end
  end

  def self.update_all
    Company.all.each do |c|
      c.description = GetFromWiki.get_from_wiki(c.name)
      c.save
    end
  end
end

