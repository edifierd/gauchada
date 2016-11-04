class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.boolean :otorgado
      t.text :cuerpo
      t.integer :user_id
      t.integer :favor_id

      t.timestamps null: false
    end
  end
end
