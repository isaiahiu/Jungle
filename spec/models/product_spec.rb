require 'rails_helper'
require 'product'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully if all validations are met' do
      @category = Category.new
      @product = Product.create(name: "test", price: 30, quantity: 6, category: @category)

      expect(@product.id).to be_present
    end

  end
end
