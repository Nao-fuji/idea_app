class CreateRecruits < ActiveRecord::Migration[6.0]
  def change
    create_table :recruits do |t|
      t.string :theme,          null: false
      t.string :price,          null: false
      t.integer :category_id,   null: false
      t.text :other
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
