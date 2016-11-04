class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.string :titulo
      t.integer :cantidad_eslabones

      t.timestamps null: false
    end
  end
end
