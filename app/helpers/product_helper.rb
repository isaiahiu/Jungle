module ProductHelper
  def in_stock? (product)
    if product.quantity == 0
      false
    else
      true
    end
  end
end
