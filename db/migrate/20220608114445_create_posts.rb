class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :caption
      t.integer :status, default: 1
      t.integer :customer_id
      t.integer :category_id

      t.timestamps
    end
  end
end
