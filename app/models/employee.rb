class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable

	has_many :order_employees
	has_many :orders, through: :order_employees

	validate :rut_validation
	validates_uniqueness_of :rut

	def rut_validation
		if rut == "hola"
		errors.add(:rut, "can't be destroyed cause x,y or z")
		throw(:abort)
		end
	end

end
