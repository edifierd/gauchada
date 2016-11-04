class CreateFavors < ActiveRecord::Migration
  def change
    create_table :favors do |t|
      t.string :titulo
      t.string :ubicacion
      t.text :descripcion
      t.string :foto
      t.string :estado
      t.datetime :fecha
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
