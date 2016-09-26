class AddPriceToUnsubs < ActiveRecord::Migration
  def change
    add_monetize :unsubs, :price, currency: { present: false }
  end
end
