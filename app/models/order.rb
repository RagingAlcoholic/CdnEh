class Order < ActiveRecord::Base
  PAYMENT_TYPES = ["Paypal", "Credit Card"]
end
