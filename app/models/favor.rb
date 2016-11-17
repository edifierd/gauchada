class Favor < ActiveRecord::Base
	has_many :offers
	has_many :comments
	belongs_to :user
	
	validates_uniqueness_of :titulo

	def postulado(id)
		if self.offers.where("user_id = "+id.to_s).count > 0 
			return true
		end
		return false
	end
end
