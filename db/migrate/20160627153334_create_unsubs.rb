class CreateUnsubs < ActiveRecord::Migration
  def change
    create_table :unsubs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true
      t.json :form_complete

      t.timestamps null: false
    end
  end
end
