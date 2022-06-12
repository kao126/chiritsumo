class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.integer :category, null: false
      t.string :hash_name

      t.timestamps
    end
  end
end
