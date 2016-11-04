class Favor < ActiveRecord::Base
	has_many :offers
	has_many :comments
	belongs_to :user
	
end
