module FavoriteResourcesHelper
	def link_to_toggle_favorite_resource(resource)
		post_url = favorite_resources_path(resource_id: resource)
		delete_url = favorite_resource_path(resource)
		if resource.favorited?(resource)
			link_to_with_icon('fa fa-bookmark', 'Remove Bookmark', delete_url, {
				method: 'DELETE',
				remote: true
			})
		else
			link_to_with_icon('fa fa-bookmark-o', 'Add Bookmark', post_url, {
				method: 'POST',
				remote: true
			})
		end
	end

	def link_to_with_icon(icon_css, title, url, options = {})
		icon = content_tag(:i, nil, class: icon_css)
		title_with_icon = icon << ' '.html_safe << h(title)
		link_to(title_with_icon, url, options)
	end
end
