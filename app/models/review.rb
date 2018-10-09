class Review < ApplicationRecord
	belongs_to :book 
	belongs_to :user
	validates :editor, :review, :rank , presence: true
end
