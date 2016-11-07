class AddFieldFavor < ActiveRecord::Migration
  def change
  	remove_column :favors, :foto
  	add_column :favors, :foto, :string, {:default=>''}
  end
end
