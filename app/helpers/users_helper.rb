module UsersHelper
  def avatar_for(user, options = { size: 60 })
    size  = options[:size]
    image_tag("logo.jpg", class: "avatar", size: size, alt: user.name)
  end
end
