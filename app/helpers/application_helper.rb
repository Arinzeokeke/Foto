module ApplicationHelper
	def alert_for(flash_type)
		{ success: 'alert-success',
			error: 'alert-danger',
			alert: 'alert-warning',
			notice: 'alert-info'
			}[flash_type.to_sym] || flash_type.to_s
		end
	end
	def profile_avatar_select(user)
		return image_tag user.avatar.url(:medium), id: 'image-preview', class: 'img-responsive img-circle profile- image' if user.avatar.exists?
		image_tag 'default-avatar.jpg', id: 'image-preview', class: 'img-responsive img-circle profile-image'
	end

	def form_image_select(post)
		if post.avatar.exists?
			return image_tag post.avatar.url(:medium), id: 'image-preview', class: 'img-responsive'
		else
			image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
		end
	end
	 def list_likes(likers)
    	res = "#{link_to likers[0].user_name, profile_path(likers[0].user_name)}"
    	if likers.length > 1
      		for i in 1..likers.length-2
      			user = likers[i].user_name
      			res += ", #{link_to likers[i].user_name, profile_path(likers[i].user_name)}"
      			#link_to likers[i].user_name, profile_path(likers[i].user_name)
      		end
      		res += " and #{link_to likers[-1].user_name, profile_path(likers[-1].user_name)} "
    	end
    	if (likers.length > 1)
    		res += " like this"
    	else
    		res += " likes this"
    	end

    	return res
  	end



