require 'rails_helper'
require 'product'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully if all validations are met' do
      @category = Category.new
      @product = Product.create(name: "test", price: 30, quantity: 6, category: @category)

      expect(@product.id).to be_present
    end
    it 'should give an error if name is ommitted' do 
      @category = Category.new
      @product = Product.create(name: nil, price: 30, quantity: 6, category: @category)

      expect(@product.id).to_not be_present
      expect(@product.errors.full_messages).to include "Name can't be blank"
      end
    it 'should give an error if price is ommitted' do #to do
      @category = Category.new
      @product = Product.create(name: "Test", quantity: 6, category: @category)

      expect(@product.id).to_not be_present
      expect(@product.errors.full_messages).to include "Price cents is not a number", "Price is not a number", "Price can't be blank"

    end
    it 'should give an error if quantity is ommitted' do 
      @category = Category.new
      @product = Product.create(name: "Test", price: 30, quantity: nil, category: @category)

      expect(@product.id).to_not be_present
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end
    it 'should give an error if category is ommitted' do 
      @category = Category.new
      @product = Product.create(name: "Test", price: 30, quantity: 6, category: nil)

      expect(@product.id).to_not be_present
      expect(@product.errors.full_messages).to include "Category must exist", "Category can't be blank"
    end
  end
end
