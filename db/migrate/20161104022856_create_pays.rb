class CreatePays < ActiveRecord::Migration
  def change
    create_table :pays do |t|
      t.integer :cantidad_eslabones
      t.decimal :costo_eslabon
      t.integer :user_id
      t.datetime :fecha

      t.timestamps null: false
    end
  end
end
