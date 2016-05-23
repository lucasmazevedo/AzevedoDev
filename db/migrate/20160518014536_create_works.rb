class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :link
      t.string :tags
      t.references :category
      t.timestamps null: false
    end
  end
end
