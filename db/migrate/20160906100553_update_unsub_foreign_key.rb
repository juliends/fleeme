class UpdateUnsubForeignKey < ActiveRecord::Migration
  def change
    remove_foreign_key :unsubs, :users
    add_foreign_key :unsubs, :users, on_delete: :cascade
  end
end
