class NotificacionesController < ApplicationController
  def index
  	@cantOffers = Offer.all.where("visto = 'false'").count
  	@cantPostulaciones = current_user.offers.where("otorgado = true and vistopostulante = 'false' ").count
	  #Respuestas nuevas a mensajes enviados
  	@respuestas = current_user.comments.where("visto_respuesta = 'false' and respuesta != 'null' ")
  	
    #notificacion de si fue realizado
    @cantRealizado = 0
    current_user.offers.where("otorgado = true and vistorealizacion = 'false' ").each do |offer|
    favor = Favor.find(offer.favor_id)
      if favor.estado == 'r' or favor.estado == 'nr'
        @cantRealizado += 1
      end
    end

    #Mensajes recibidos en mis gauchadas
  	@favors = current_user.favors
  	@cantMensajes = 0
  	@favors.each do |favor| 
  		@cantMensajes += favor.comments.where("visto_mensaje = 'false'").count
  	end
  end

  def marcarVitoRespuesta
	com = Comment.find(params[:id])
	com.visto_respuesta = 'true'
	com.save
	redirect_to Favor.find(com.favor_id)
  end
end
