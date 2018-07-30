class Resource < ApplicationRecord
	enum resource_category: [ "Adoption Agency", "Book", "DNA Test", "Event", "Film, TV, and Music", "KAD-Run Organization", "Local Group", "Tour", "Other", "Resources for Kids", "Travel Tips" ]

	belongs_to :user
	has_many :reviews
end
