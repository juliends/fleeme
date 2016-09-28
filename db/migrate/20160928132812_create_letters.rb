class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.text :text
      t.references :unsub, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
