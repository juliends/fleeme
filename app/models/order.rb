class Order < ActiveRecord::Base

  #money-rails gem
  monetize :amount_cents
end
