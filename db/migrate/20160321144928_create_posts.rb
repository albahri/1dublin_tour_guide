class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_message
      t.references :guide, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
