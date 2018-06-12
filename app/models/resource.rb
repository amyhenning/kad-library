class Resource < ApplicationRecord
	enum type: { "Adoption Agencies": 0, "Books": 1, "DNA Testing": 2, "Events": 3, "Film, TV, and Music": 4, "KAD-Run Organizations": 5, "Local Groups": 6, "Tours": 7, "Other": 8 }
end
