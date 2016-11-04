class Ranking < ActiveRecord::Base
	validates :titulo,presence:true,uniqueness:true
	validates :cantidad_eslabones,presence:true,uniqueness:true
	default_scope ->{order("cantidad_eslabones")}
end
