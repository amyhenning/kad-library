class Review < ApplicationRecord
	belongs_to :resource, dependent: :destroy
	belongs_to :user, dependent: :destroy
end
