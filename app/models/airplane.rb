class Airplane < ApplicationRecord
	has_many :bookings
	validates_presence_of :name
	validates_uniqueness_of :name
	def self.search(search)
		if search
			@airplanes = Airplane.where( "name LIKE :query OR source LIKE :query OR destination LIKE :query OR category LIKE :query", query: "%#{search}%")

		else
			@airplanes = Airplane.all
		end
	end
end
