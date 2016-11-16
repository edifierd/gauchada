class AddFildOffer < ActiveRecord::Migration
  def change
  	add_column :offers, :visto, :string, {:default=>'false'}
  end
end
