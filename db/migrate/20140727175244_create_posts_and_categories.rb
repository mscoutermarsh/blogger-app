class CreatePostsAndCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :posts do |t|
      t.string :title
      t.string :content
      t.belongs_to :author

      t.timestamps
    end

    create_table :categories_posts, id: false do |t|
      t.belongs_to :post
      t.belongs_to :category
    end
  end
end
