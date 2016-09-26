class AddStateAndPaymentToUnsub < ActiveRecord::Migration
  def change
    add_column :unsubs, :state, :string
    add_column :unsubs, :payment, :json
  end
end
