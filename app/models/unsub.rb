class Unsub < ActiveRecord::Base
  belongs_to :user
  belongs_to :service

  # money-rails gem
  monetize :price_cents  # or :price_pennies
end
