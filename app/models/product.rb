class Product < ActiveRecord::Base
  belongs_to :category
  has_one :sale_item
  has_many :cart_items

  before_destroy :ensure_not_referenced_by_any_cart_item

  mount_uploader :image, ImageProductsUploader
  private

  def ensure_not_referenced_buy_any_cart_item
    if cart_items.empty?

      return true
    else

      errors.add(:base, 'Cart Items present')

      return false
    end
  end
end
