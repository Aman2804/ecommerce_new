class Item < ApplicationRecord
	belongs_to :category
	has_many :pictures, as: :imageable
end
