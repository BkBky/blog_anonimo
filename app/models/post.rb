class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :post_tags

  #Trefiere a la relación muchos a muchos y se declara en plural
  has_many :tags, through: :post_tags
  #:presence => true es el que indica que no puede ser nulo el valor
  validates :body, :presence => true
  validates :title, :presence => true
end
