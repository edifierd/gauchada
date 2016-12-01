class FavorsController < ApplicationController
   def show
     if Favor.find(params[:id]).estado != 'e'
  	   @favor = Favor.find(params[:id])
       offer = @favor.offers.where("otorgado = true").first
       if offer
         @postulado = User.find(offer.user_id)
       end
     else 
      flash[:danger] = "Esta gauchada ya no existe"
      redirect_to ("/")
    end
   end

   def create
   	if current_user.eslabon > 0 and can? :create, Favor
    	@favor = Favor.new
    	@favor.titulo = params[:favor][:titulo]
    	@favor.descripcion = params[:favor][:descripcion]
    	@favor.user_id = current_user.id
    	@favor.estado = 'a'
    	@favor.ubicacion = params[:ubicacion]
    	@favor.foto = params[:favor][:foto]
      current_user.eslabon = current_user.eslabon - 1;
      current_user.save
    	if @favor.save
        flash[:success] = "El favor ha sido publicado exitosamente."
        redirect_to @favor
      else 
        flash[:danger] = "Ya existe una gauchada con ese nombre o se produjo un error."
        redirect_to (:back)
      end
    else 
      flash[:danger] = "No tienes más eslabones. Comprá más para poder publicar"
      redirect_to ("/")
    end
   end

   def new
   	if can? :create, Favor
    	@favor = Favor.new   
    else 
    	flash[:danger] = "No cuenta con los permisos para publicar. REGISTRESE."
    	redirect_to ("/")
    end
   end

   def edit
    f = Favor.find(params[:id])
    if can? :update, f and f.estado == 'a'
      @favor = Favor.find(params[:id])  
    else 
      flash[:danger] = "No puedes editar esta gauchada. "
      redirect_to ("/")
    end  
   end

   def update
    f = Favor.find(params[:id])
    if can? :update, f and f.estado == 'a'
      @favor = Favor.find(params[:id])
      @favor.titulo = params[:favor][:titulo]
      @favor.descripcion = params[:favor][:descripcion]
      @favor.ubicacion = params[:ubicacion]
      @favor.foto = params[:favor][:foto]
      if @favor.save
        flash[:success] = "El favor ha sido actualizado exitosamente."
        redirect_to @favor
       else 
        flash[:danger] = "Ya existe una gauchada con ese nombre o se produjo un error."
        redirect_to (:back)
      end
    end
  end

  def destroy
    favor = Favor.find(params[:id])
    if can? :destroy, favor and favor.estado == 'a'
      if favor.user_id == current_user.id
        favor.estado = 'e'
        favor.offers.destroy_all
        if favor.save
          flash[:success] = "La gauchada se ha cancelado exitosamente"
          redirect_to ("/")
        else
          flash[:danger] = "La gauchada no se pudo cancelar"
          redirect_to (:back)
        end
      else
        flash[:danger] = "Solo se pueden eliminar las gauchadas propias"
        redirect_to (:back)
      end
    else 
      flash[:danger] = "No cuenta con los permisos para eliminar. O no puede eliminarse."
      redirect_to (:back)
    end
  end

  def postulantes
    @favor = Favor.find(params[:id])
    @favor.offers.each do |offer| 
      if offer.visto = 'false' 
        offer.visto = 'true'
        offer.save
      end
    end
  end

  def aceptar_postulante
    favor = params[:favor]
    user = params[:id]
    offer = Offer.all.where("user_id = "+user+" and favor_id = "+favor).first
    offer.otorgado = true;
    if offer.save
        f = Favor.find(favor)
        f.estado = 'p'
        if f.save
          flash[:success] = "Se acepto satisfactoriamente al postulante."
          redirect_to (f)
        else 
          flash[:danger] = "Hubo un error al modificar el estado de la gauchada."
          redirect_to (:back)
        end
    else
      flash[:danger] = "Hubo un error al seleccionar el postulante."
      redirect_to (:back)
    end
  end

  def marcarComoRealizado
    favor = Favor.find(params[:favor])
    user_id = favor.postulante
    if favor.estado == 'p' and user_id != -1
      favor.estado = 'r'
      favor.save
      user = User.find(user_id)
      user.eslabon = user.eslabon + 1
      user.save
      flash[:success] = "Se marco correctamente la gauchada como Realizado"
    else
      flash[:danger] = "Hubo un error al querer marcar la gauchada como Realizado."
    end
    redirect_to (:back)
  end

  def marcarComoNoRealizado
    favor = Favor.find(params[:favor])
    user_id = favor.postulante
    if favor.estado == 'p' and user_id != -1
      favor.estado = 'nr'
      favor.save
      user = User.find(user_id)
      user.eslabon = user.eslabon - 2
      user.save
      flash[:success] = "Se marco correctamente la gauchada como NO realizado"
    else
      flash[:danger] = "Hubo un error al querer marcar la gauchada como NO realizado."
    end
    redirect_to (:back)
  end

end
