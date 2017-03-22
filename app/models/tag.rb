class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :post_tags
  has_many :posts, through: :post_tags
  #uniqueness: true es el que indica que la tag debe ser única, no se debe repetir-
  validates :tag, uniqueness: true
end
