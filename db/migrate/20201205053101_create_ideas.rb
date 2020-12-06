class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|
      t.string :title,          null: false
      t.string :idea,           null: false
      t.text :other
      t.integer :price,         null: false
      t.integer :category_id,   null: false
      t.references :user,       null:false,foreign_key: true
      t.timestamps
    end
  end
end
