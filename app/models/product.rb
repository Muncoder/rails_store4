class Product < ActiveRecord::Base

	validates :name, presence: true
	validates :price, presence: true
	validates_numericality_of :price
	validates :description, presence: true

	belongs_to :user

end