class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end
  
  def search_by_companies
    map = Company.all.map do |company|
      {tolower(company.name) => company}
    end
  end
  
  def self.search_by_companies(param)
    param = param.downcase
    map = Hash[Company.all.map{|com| [com.name.downcase, com]}]
    result = []
    map.keys.each do |key|
      result << map[key] if key.include? param
    end
    result
  end
  
  def self.search_by_technologies(param)
    param = param.downcase
    map = Hash[Technology.all.map{|tech| [tech.name.downcase, tech]}]
    result = []
    map.keys.each do |key|
      result << map[key] if key.include? param
    end
    result
  end
  
  def self.top_technologies(n)
    Technology.all.sort_by{ |t| t.companies.count }.reverse.take(n)
  end

end
