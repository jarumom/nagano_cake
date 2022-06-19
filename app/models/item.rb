class Item < ApplicationRecord
  has_one_attached:image
  has_many :cart_items
  belongs_to :genre
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
      image
  end

  def with_tax_price
    (price*1.1).floor
  end

end
