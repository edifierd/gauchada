class UsersController < ApplicationController
  def index
  end

  def show
  	@user=User.find(params[:id])
  	 Ranking.all.each do |ranking| 
					if(ranking.cantidad_eslabones<= @user.eslabon )
						@a = ranking.titulo 
					end

  	end
  end
end
