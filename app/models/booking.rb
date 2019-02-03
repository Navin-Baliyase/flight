class Booking < ApplicationRecord
	belongs_to :airplane
	before_create :set_pnr
	def set_pnr
		self.pnr = SecureRandom.urlsafe_base64(6)
	end
end
