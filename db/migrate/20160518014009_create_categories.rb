class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.belongs_to :works, index: true
      t.string :name, :limit => 80
      t.timestamps null: false
    end
  end
end
