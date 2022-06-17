class Item < ApplicationRecord
  has_one_attached:image
  belongs_to :cart_item

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
      image
  end

end
