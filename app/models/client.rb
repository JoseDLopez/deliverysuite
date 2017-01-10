class Client < ApplicationRecord
	has_many :orders
	geocoded_by :address
	after_validation :geocode

	validates :rut, rut: true
	validates :name, :lastname, :phone, :address, presence: true
	validates_uniqueness_of :rut
end
