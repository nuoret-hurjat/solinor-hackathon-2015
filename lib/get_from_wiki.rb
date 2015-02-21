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
      if c.description.nil?
        c.description = "Mieleni minun tekevi, aivoni ajattelevi lähteäni laulamahan, saa'ani sanelemahan, sukuvirttä suoltamahan, lajivirttä laulamahan. Sanat suussani sulavat, puhe'et putoelevat, kielelleni kerkiävät, hampahilleni hajoovat.
\n
Veli kulta, veikkoseni, kaunis kasvinkumppalini! Lähe nyt kanssa laulamahan, saa kera sanelemahan yhtehen yhyttyämme, kahta'alta käytyämme! Harvoin yhtehen yhymme, saamme toinen toisihimme näillä raukoilla rajoilla, poloisilla Pohjan mailla."
      end
      c.save
    end
  end

end

