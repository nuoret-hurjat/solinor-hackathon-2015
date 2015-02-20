class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :logo
      t.text :description
      t.boolean :admin_edited

      t.timestamps null: false
    end
  end
end
