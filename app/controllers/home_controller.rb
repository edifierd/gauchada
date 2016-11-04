class HomeController < ApplicationController
  def index
  	@favor = Favor.all
  end
end
