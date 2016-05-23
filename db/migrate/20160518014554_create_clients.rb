class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :onwer
      t.string :name
      t.string :address
      t.string :phone
      t.string :cellphone
      t.string :email
      t.string :logotype
      t.text :description
      t.timestamps null: false
    end
  end
end
