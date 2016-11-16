class FavorsController < ApplicationController
   def show
  	 @favor = Favor.find(params[:id])
   end

   def create
   	if current_user.eslabon > 0
    	@favor = Favor.new
    	@favor.titulo = params[:favor][:titulo]
    	@favor.descripcion = params[:favor][:descripcion]
    	@favor.user_id = current_user.id
    	@favor.estado = true
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
    if can? :update, Favor.find(params[:id]) 
      @favor = Favor.find(params[:id])  
    else 
      flash[:danger] = "No cuenta con los permisos para editar."
      redirect_to ("/")
    end  
   end

   def update
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

  def destroy
    if can? :destroy, Favor
      favor = Favor.find(params[:id])
      if favor.user_id == current_user.id
        favor.estado = 'f'
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
      flash[:danger] = "No cuenta con los permisos para eliminar."
      redirect_to (:back)
    end
 
  end
end
