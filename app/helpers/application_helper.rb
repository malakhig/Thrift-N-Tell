module ApplicationHelper

  include Pagy::Frontend
  def avatar_for(user, size)
    avatar = user.avatar
    if avatar.attached?
      image_tag avatar.variant(resize_to_fill: [size*2, size*2]).processed, size: "#{size}x#{size}", class: "rounded-circle"
    else
      image_tag "blank-profile-picture-973460_1280.png", size: "#{size}x#{size}", class: "rounded-circle"
    end
  end
end
