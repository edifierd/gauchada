class HomeController < ApplicationController
  def index
  	if params[:ubicacion]
  		@ubicacion = params[:ubicacion]
  		@favor = Favor.all.where("estado='a' and ubicacion='"+@ubicacion+"'").order('id DESC')
  		@ubicacion = " en "+params[:ubicacion]
  		@destacados = Favor.all.where("estado='a'").order('id DESC').limit(3)
  	else
  		@favor = Favor.all.where("estado='a'").order('id DESC')
  	end
  end

end
