class AddFieldEslabonUser < ActiveRecord::Migration
  def change
  	add_column :users, :eslabon, :integer, {:default=>1}
  end
end
