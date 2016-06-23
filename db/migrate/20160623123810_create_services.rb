class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :company
      t.string :street_address
      t.integer :zip_code
      t.string :city
      t.string :postal_box
      t.json :form_specs

      t.timestamps null: false
    end
  end
end
