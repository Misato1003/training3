class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :content
      t.references :cook, foreign_key: true

      t.timestamps
    end
  end
end
