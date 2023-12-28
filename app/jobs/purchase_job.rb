# app/jobs/purchase_job.rb
class PurchaseJob < ApplicationJob
  queue_as :default

  def perform(user, product, token)
    PurchaseService.new(user, product).process_purchase_with_stripe(token)
  end
end
