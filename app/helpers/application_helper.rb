module ApplicationHelper
	def alert_for(flash_type)
		{ success: 'alert-success',
			error: 'alert-danger',
			alert: 'alert-warning',
			notice: 'alert-info'
			}[flash_type.to_sym] || flash_type.to_s
		end
	end

	def form_image_select(post)
		if post.avatar.exists?
			return image_tag post.avatar.url(:medium), id: 'image-preview', class: 'img-responsive'
		else
			image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
		end
	end

	def comments_display(comments)
		
	end
