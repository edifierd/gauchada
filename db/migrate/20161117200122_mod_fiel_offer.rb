class ModFielOffer < ActiveRecord::Migration
  def change
  	change_table :offers do |t|
  		t.rename :vistoPostulante, :vistopostulante
	end
  end
end
