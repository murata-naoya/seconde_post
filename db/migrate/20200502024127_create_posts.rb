class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.string :title
      t.string :channel
      t.text :body
      t.timestamps
    end
  end
end
