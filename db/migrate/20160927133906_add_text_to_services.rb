class AddTextToServices < ActiveRecord::Migration
  def change
    add_column :services, :text_base, :json
  end
end
