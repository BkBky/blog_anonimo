class PostTag < ActiveRecord::Base
  # Remember to create a migration!
  #Se declaran en singular
  belongs_to :post
  belongs_to :tag
end
