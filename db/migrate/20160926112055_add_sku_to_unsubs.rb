class AddSkuToUnsubs < ActiveRecord::Migration
  def change
    add_column :unsubs, :sku, :string
  end
end
