# app/workers/product_report_worker.rb
class ProductReportWorker
  @queue = :reports

  def self.perform
    report_content = generate_report_content

    save_report_locally(report_content)
  end

  def generate_report_content
    
  end
end
