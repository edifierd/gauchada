class NotificacionesController < ApplicationController
  def index
  	@cantOffers = Offer.all.where("visto = 'false'").count
  	@cantPostulaciones = current_user.offers.where("otorgado = true and vistopostulante = 'false' ").count
  end
end
