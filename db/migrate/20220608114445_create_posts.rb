class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :caption
      t.integer :status
      t.integer :customer_id

      t.timestamps
    end
  end
end
