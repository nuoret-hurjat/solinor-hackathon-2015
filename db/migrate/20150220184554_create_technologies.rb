class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
      t.string :name
      t.string :url
      t.string :logo
      t.boolean :front
      t.boolean :back
      t.text :description

      t.timestamps null: false
    end
  end
end
