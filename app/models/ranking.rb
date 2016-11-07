class Ranking < ActiveRecord::Base
	validates_uniqueness_of :titulo
	validates_uniqueness_of :cantidad_eslabones
	default_scope ->{order("cantidad_eslabones")}
end
