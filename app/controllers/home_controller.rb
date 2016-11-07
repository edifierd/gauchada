class HomeController < ApplicationController
  def index
  	@favor = Favor.all.order('id DESC')
  end
end
