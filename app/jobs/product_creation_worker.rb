class ProductCreationWorker < ApplicationJob
  queue_as :default

  def perform(name, description, price)
    Product.create(name: name, description: description, price: price)
  end
end
