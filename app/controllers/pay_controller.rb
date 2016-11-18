class PayController < ApplicationController
  def show
  end

  def new
  		
		pay = Pay.new
		pay.cantidad_eslabones = params[:cantidad_eslabones]
		pay.costo_eslabon = '12'
		pay.user_id = current_user.id
    flash[:success] = "Prueba" 
		if pay.save
  			flash[:success] = "La compra fue realizada correctamente"
  			current_user.eslabon = current_user.eslabon + pay.cantidad_eslabones
  			current_user.save
      	else
      		flash[:danger] = "Algo salio mal, no se ha podido realizar la compra"
      	end
      	redirect_to ('/')
	end

end
