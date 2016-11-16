class RankingController < ApplicationController
  
  def index
   @rankings = Ranking.all;
  end

  def show
   @ranking= Ranking.find(params[:id])
  end

  def new
  	@ranking = Ranking.new
  end

 def create
 	if can? :create, Ranking
  		@ranking = Ranking.new
  		@ranking.titulo=params[:ranking][:titulo]
  		@ranking.cantidad_eslabones=params[:ranking][:cantidad_eslabones]
  		
 		 if @ranking.save
        	flash[:success] = "El logro ha sido creado exitosamente."
        	redirect_to ("/ranking/index")
    	 else 
        	flash[:danger] = "Ya existe un logro con ese nombre o eslabones necesarios."
        	redirect_to (:back)
 		   end
 	else
 	 	  flash[:danger] = "No tienes los permisos necesarios para crear un Logro."
      redirect_to (:back)
  end

  def edit

  if can? :update, Ranking 
      @ranking = Ranking.find(params[:id])  
  else 
      flash[:danger] = "No cuenta con los permisos para editar."
      redirect_to ("/")
  end  
  end

 	end

def destroy
  if can? :destroy, Ranking 
    ranking = Ranking.find(params[:id])
   if ranking.cantidad_eslabones != Ranking.first.cantidad_eslabones
    if ranking.destroy
      flash[:success] = "El Logro ha sido eliminado exitosamente."
      redirect_to ("/ranking/index")
    else
      flash[:danger] = "No se pudo eliminar el logro"
      redirect_to ('/ranking/index')
    end
  else
    flash[:danger] = "Este logro no puede ser eliminado"
    redirect_to ("/ranking/index")
  end
  else 
      flash[:danger] = "No cuenta con los permisos para eliminar."
      redirect_to ("/")
  end
end
def update
  if can? :update, Ranking
    @ranking = Ranking.find(params[:id])
    if @ranking.cantidad_eslabones != Ranking.first.cantidad_eslabones
      @ranking.titulo = params[:ranking][:titulo]
      @ranking.cantidad_eslabones = params[:ranking][:cantidad_eslabones]
      if @ranking.save
        flash[:success] = "El Logro ha sido actualizado exitosamente."
        redirect_to @ranking
      else 
        flash[:danger] = "Ya existe un logro con ese nombre o eslabones necesarios."
        redirect_to (:back)
      end
      else
      flash[:danger] = "Este Logro no se puede editar"
      redirect_to ("/ranking/index")
      end
    end
  end
end