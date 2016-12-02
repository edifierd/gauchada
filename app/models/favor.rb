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

	def postulante
		if self.estado == 'p'
			return self.offers.where("otorgado = true").last.user.id
		else
			return -1
		end
	end

	def estadoActual
		if self.estado == 'a' 
            estado = "Activo" 
        elsif self.estado == 'e'
            estado = "Eliminado"
        elsif self.estado == 'p'
            estado = "Pendiente"
        elsif self.estado == 'r'
            estado = "Finalizado, Exitoso"
        elsif self.estado == 'nr'
            estado = "Finalizado, No cumplido"
        end
        return estado
	end

	def isPropietario(user)
		return self.user_id == user.id
	end
end
