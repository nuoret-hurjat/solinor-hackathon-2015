class Technology < ActiveRecord::Base
  has_and_belongs_to_many :companies

  scope :top, -> { order(:companies.count, desc)}

  def companies_count
    self.companies.count
  end
end
