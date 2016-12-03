class AddFieldVistoRealizacion < ActiveRecord::Migration
  def change
  	add_column :offers, :vistorealizacion, :string, {:default=>'false'}
  end
end
