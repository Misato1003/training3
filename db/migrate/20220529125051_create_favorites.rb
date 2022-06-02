class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :cook, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
