class HomeController < ApplicationController
  def index
  	@favor = Favor.all.where("estado='t'").order('id DESC')
  	#
  end
end
