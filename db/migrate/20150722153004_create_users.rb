class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :imgUrl
      t.integer :membSince
      t.string :description
      t.string :location
      t.integer :completion

      t.timestamps null: false
    end
  end
end
