class OffersController < ApplicationController

  def edit
  	favor = Favor.find(params[:id]) 
  	flash[:danger] = "Se ha creado el ofrecimiento"+favor.titulo
    redirect_to ("/")
  end




end
