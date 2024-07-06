module NotificationsHelper
  def thumbnail(image, size: 50) # Default size set to 50x50
    if image
      image_tag image.variant(resize_to_fill: [size*2, size*2]).processed, size: "#{size}x#{size}", class: "rounded"
    else
      image_tag "no_image.jpg", size: "#{size}x#{size}", class: "rounded" # Ensure you have a default image in your assets
    end
  end
end

