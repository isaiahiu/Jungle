class Admin::DashboardController < Admin::BaseController

  def show
    @products = Product.all.count
    @categories = Category.count
  end
end
