class ChangeTypeForFormSpecs < ActiveRecord::Migration
  def up
    change_column :services, :form_specs, :string
  end

  def down
    change_column :services, :form_specs, :json
  end
end
