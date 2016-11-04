class RankingController < ApplicationController
  def index
  	@rankings = Ranking.all
  end

  def show
   @ranking= Ranking.find(params [:id]);
  end
end
