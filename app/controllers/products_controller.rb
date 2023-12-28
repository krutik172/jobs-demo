class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all.order(:created_at)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      # Queue Delayed Job for Product Creation
      ProductCreationWorker.perform_later(@product.name, @product.description, @product.price)

      # Queue Sidekiq Job for Email Notification
      # EmailNotificationWorker.perform_async(@product.id)

      flash[:success] = 'Product created successfully'
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def purchase
    @product = Product.find(params[:id])
    token = params[:stripeToken] # Retrieve the token from params

    # Queue purchase process as a delayed job
    PurchaseJob.perform_later(current_user, @product, token)

    redirect_to @product, notice: 'Purchase process initiated.'
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
