class Client < ApplicationRecord
	has_many :orders
	geocoded_by :address
	after_validation :geocode

	validates :rut, rut: true
	validates :name, :lastname, :phone, :address, presence: { message: "No deben existir campos vacíos" }
	validates_uniqueness_of :rut, :message => "Ingresa RUT por favor" 
end
