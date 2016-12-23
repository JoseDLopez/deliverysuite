class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable

	has_many :order_employees
	has_many :orders, through: :order_employees

	validates :rut, rut: true
	validates :name, :lastname, :phone, :position, presence: true
	validates_uniqueness_of :rut

end
