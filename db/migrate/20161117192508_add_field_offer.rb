class AddFieldOffer < ActiveRecord::Migration
  def change
  	  	add_column :offers, :vistoPostulante, :string, {:default=>'false'}
  end
end
