class Offer < ActiveRecord::Base
	belongs_to :user
	belongs_to :favor

	def is_pendiente?
		rta = false
		if(self.visto == "false")
			rta = true
		end
		return rta
	end

end
