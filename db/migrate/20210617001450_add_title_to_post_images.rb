class AddTitleToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :title, :string
  end
end
