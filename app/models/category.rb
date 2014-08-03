class Category < ActiveRecord::Base
  replicated_model
  has_and_belongs_to_many :posts
  validates_presence_of :name
end
