class UsersController < ApplicationController

  def index
  end

  def show
  	@user=User.find(params[:id])
  	Ranking.all.each do |ranking| 
			if(ranking.cantidad_eslabones <= @user.eslabon )
				@a = ranking.titulo 
			end
  	end
    @favores = @user.favors.order('id DESC')
  end

  def edit    
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "/"
  end

  def passReset
    if current_user 
      flash[:danger] = "Usted se encuentra actualmente logueado en su cuenta"
      redirect_to ('/')
  	elsif (params[:email].blank?  )
  		flash[:danger] = "Debe indicar su correo"
  		redirect_to :back
  	
  	elsif (params[:secret_question].blank?  )
  		flash[:danger] = "Debe indicar su una respuesta a la pregunta"
  		redirect_to :back
  	
  	elsif (User.by_email(params[:email]).count == 1)
		user = User.by_email(params[:email]).first
    @pass = Random.new.rand(11111111..99999999)
		if (user.secret_question == params[:secret_question])
			user.password = @pass
			user.password_confirmation = @pass
  			if user.save
  			else 
  				flash[:danger] = "Se produjo algun error por favor intente nuevamente"
  				redirect_to :back
  			end
  		else
  			flash[:danger] = "La respuesta a la pregunta no es valida"
  			redirect_to :back
  		end
	else
		flash[:danger] = "No existe usuario con el correo: "+params[:email]
		redirect_to :back
	end

  end

  def passForm
    if current_user 
      flash[:danger] = "Usted se encuentra actualmente logueado en su cuenta"
      redirect_to ('/')
    end
  end






end
