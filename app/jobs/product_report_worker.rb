# app/workers/product_report_worker.rb
class ProductReportWorker
  @queue = :reports

  def self.perform
    report_content = generate_report_content
    save_report_locally(report_content)
    # dir_path = Rails.root.join('product_report')
    # FileUtils.mkdir_p(dir_path) unless File.directory?(dir_path)
    # products = Product.pluck(:id, :name, :description, :price)
    # report = products.map { |product| product.join(', ') }.join("\n")
    # file_path = dir_path.join('product_report.txt')
    # File.open(file_path, 'w') do |file|
    #   file.write(report)
    # end
  end

  private

  def generate_report_content
    products = Product.pluck(:id, :name, :description, :price)
    products.map { |product| product.join(', ') }.join("\n")
  end

  def save_report_locally(content)
    dir_path = Rails.root.join('product_report')
    FileUtils.mkdir_p(dir_path) unless File.directory?(dir_path)

    file_path = dir_path.join('product_report.txt')
    File.open(file_path, 'w') do |file|
      file.write(content)
    end
  end
end
