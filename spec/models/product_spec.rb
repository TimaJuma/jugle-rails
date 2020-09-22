require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should check if product is valid' do
    @category = Category.new(name: "MyTest")
    @product = Product.new(name: "Laptop", price_cents: 1200, quantity: 10, :category => @category)
    expect(@product.errors).not_to include("can't be blank")
    end
    it 'should check name presence' do
    @category = Category.new(name: "MyTest")
    @product = Product.new(price_cents: 1200, quantity: 10, :category => @category)
    @product.valid?
    expect(@product.errors[:name]).to include("can't be blank")
    end
    it 'should check price presence' do
    @category = Category.new(name: "MyTest")
    @product = Product.new(name: "Laptop", price_cents: 1200, :category => @category)
    @product.valid?
    expect(@product.errors[:quantity]).to include("can't be blank")
    end
    it 'should check price presence' do
    @category = Category.new(name: "MyTest")
    @product = Product.new(name: "Laptop", quantity: 10, :category => @category)
    @product.valid?
    expect(@product.errors[:price]).to include("can't be blank")
    end
    it 'should check quantity presence' do
    @category = Category.new(name: "MyTest")
    @product = Product.new(name: "Laptop", price_cents: 1200, quantity: 10)
    @product.valid?
    expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end