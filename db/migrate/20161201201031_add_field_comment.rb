class AddFieldComment < ActiveRecord::Migration
  def change
  	add_column :comments, :respuesta, :string, {:default=>'null'} 
  	add_column :comments, :visto_respuesta, :string, {:default=>'false'} 
  	add_column :comments, :visto_mensaje, :string, {:default=>'false'} 
  end
end
