class OffersController < ApplicationController

	def new
		favor = Favor.find(params[:id].to_i) 
		offer = Offer.new
		offer.cuerpo = params[:mensaje]
		offer.user = current_user
		offer.favor = favor
		if offer.save
  			flash[:success] = "Te postulaste correctamente a esta gauchada."
      	else
      		flash[:danger] = "Algo salio mal, no te has podido postular."
      	end
      	redirect_to (:back)
	end

	def edit
  		@favor = Favor.find(params[:id]) 
  		@offer = Offer.new
  end

  def crear(favor)

  end

  def marcarVistoPostulacion
    favor = params[:favor]
    offer = current_user.offers.where("favor_id ="+favor.to_s).first
    offer.vistopostulante = 'true'
    offer.save
    redirect_to (:back)
  end

  def marcarVistoRealizacion
    favor = params[:favor]
    offer = current_user.offers.where("favor_id ="+favor.to_s).first
    offer.vistorealizacion = 'true'
    offer.save
    redirect_to (:back)
  end





end
