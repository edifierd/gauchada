class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :cantidadNotificaciones

  def cantidadNotificaciones
	cant = 0
	#SOLICITUDES DE POSTULACION
	Offer.all.each do |res|  
		if (Favor.find(res.favor_id).user.id == current_user.id) and (res.is_pendiente?)
			cant += cant + 1
		end
	end 

	cant += current_user.offers.where("otorgado = true and vistopostulante = 'false' ").count

	cant += current_user.comments.where("visto_respuesta = 'false' and respuesta != 'null' ").count
  	
  	#Mensajes recibidos en mis gauchadas
  	@favors = current_user.favors
  	@favors.each do |favor| 
  		cant += favor.comments.where("visto_mensaje = 'false'").count
  	end


	return cant
  end


end
