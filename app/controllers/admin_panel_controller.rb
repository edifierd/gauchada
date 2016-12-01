class AdminPanelController < ApplicationController
	
  def index
  	if current_user.has_role? :admin
  	else 
    	flash[:danger] = "Usted no es administrador"
    	redirect_to ("/")
    end
  end

  def recaudacion
  	#dato = params["pay"]["inicio(1i)"].to_s
  	#flash[:danger] = "Inicio ."+inicio.to_s+". y la de fin: "+fin.to_s
    if current_user.has_role? :admin
  	if (params["send"] == 'true')  
  		@inicio = Date.new(  params["pay"]["inicio(1i)"].to_i,
                         	params["pay"]["inicio(2i)"].to_i,
                          	params["pay"]["inicio(3i)"].to_i)

  		@fin = Date.new(     params["pay"]["fin(1i)"].to_i,
                         	params["pay"]["fin(2i)"].to_i,
                          	params["pay"]["fin(3i)"].to_i)
  		if @fin > @inicio
        	@pays = Pay.where("created_at >= '"+@inicio.to_s+"' and created_at <= '"+@fin.to_s+"'")
        else 
        	flash[:danger] = "Las fechas seleccionadas son incorrectas."
        	redirect_to (:back)
        end
    end
    else
    	flash[:danger] = "Usted no es administrador"
    	redirect_to ("/")
    end
  end

  def rankingEslabones
  	if current_user.has_role? :admin
  		@users = User.order('eslabon DESC')
  	else 
    	flash[:danger] = "Usted no es administrador"
    	redirect_to ("/")
    end
  end

end
