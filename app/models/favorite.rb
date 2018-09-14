class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :favorited, polymorphic: true

  def resource
  	# if resource is nil, set it to what's on the right
  	# the next time you call the method, it will be a valid resource (as long as it finds one)
  	@resource ||= Resource.find_by_id(favorited_id)
  end
end
