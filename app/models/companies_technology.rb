class CompaniesTechnology < ActiveRecord::Base
  belongs_to :company
  belongs_to :technology
end
