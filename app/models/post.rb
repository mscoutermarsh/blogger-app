class Post < ActiveRecord::Base
  belongs_to :author
  has_and_belongs_to_many :categories
  validates_presence_of :title, :content
end
