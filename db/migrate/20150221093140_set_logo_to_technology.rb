class SetLogoToTechnology < ActiveRecord::Migration
  def change
    logo_url = "https://raw.githubusercontent.com/ElbertF/Wappalyzer/master/src/icons/"
    Technology.all.each do |tech|
      tech.logo = "#{logo_url}#{tech.name}.png"
      tech.save
    end
  end
end
