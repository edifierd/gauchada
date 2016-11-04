class FavorsController < ApplicationController
   def show
  	 @favor = Favor.find(params[:id])
   end
end
