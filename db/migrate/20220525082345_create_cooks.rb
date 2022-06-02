class CreateCooks < ActiveRecord::Migration[6.1]
  def change
    create_table :cooks do |t|
      t.string :name
      t.string :poin
      t.string :ingredient
      t.string :recipe

      t.timestamps
    end
  end
end
