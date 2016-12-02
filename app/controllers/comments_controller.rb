class CommentsController < ApplicationController
  def index
  end

  def new
  	comment = Comment.new
  	comment.cuerpo = params[:cuerpo]
  	comment.favor_id = params[:favor_id]
  	comment.user_id = current_user.id
  	if comment.save
  		flash[:success] = "Se envio el mensaje correctamente."
        redirect_to (:back)
    else 
    	flash[:danger] = "Hubo algun problema al enviar el mensaje."
        redirect_to (:back)
    end
  end

  def responder
  	comment = Comment.find(params[:comment_id])
  	comment.respuesta = params[:cuerpo]
  	if comment.save
  		flash[:success] = "Se envio la respuesta correctamente."
        redirect_to (:back)
    else 
    	flash[:danger] = "Hubo algun problema al enviar la respuesta."
        redirect_to (:back)
    end
  end

  def delete
  	Comment.find(params[:comment_id]).destroy
  	flash[:success] = "Se elimino el comentario correctamente"
    redirect_to (:back)
  end

end
