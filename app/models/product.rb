class Product < ApplicationRecord
  belongs_to :user
  enum status: %i[Available Sold Out_of_stock]
  before_create do
    self.status ||= 'Available'
  end
end
