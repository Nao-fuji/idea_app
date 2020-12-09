class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :idea,           null: false
      t.text :explain,          null: false
      t.text :other,            null: false
      t.references :user,       null: false, foreign_key: true
      t.references :recruit,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
