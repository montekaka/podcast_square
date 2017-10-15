class Review < ApplicationRecord
	belongs_to :podcast
	validates :review_itunes_id, uniqueness: true
end
