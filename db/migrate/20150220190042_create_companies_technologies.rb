class CreateCompaniesTechnologies < ActiveRecord::Migration
  def change
    create_table :companies_technologies do |t|
      t.integer :company_id
      t.integer :technology_id

      t.timestamps null: false
    end
  end
end
