class AddFieldEslabonUser < ActiveRecord::Migration
  def change
  	remove_column :users, :eslabones
  	add_column :users, :eslabon, :integer, {:default=>1}
  end
end
