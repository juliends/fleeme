class AddDetailsToUnsubs < ActiveRecord::Migration
  def change
    add_column :unsubs, :details, :json
  end
end
