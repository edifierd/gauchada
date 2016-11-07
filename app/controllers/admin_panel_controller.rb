class AdminPanelController < ApplicationController
	
  def index
  	if current_user.has_role? :admin
  	else 
    	flash[:danger] = "Usted no es administrador"
    	redirect_to ("/")
    end
  end

end
