class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.integer :user_id
      t.string :image_id
      t.text :explain

      t.timestamps
    end
  end
end
