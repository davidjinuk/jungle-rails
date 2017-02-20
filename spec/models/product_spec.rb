require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before(:each) do
      @cat = Category.find_or_create_by! name: "test"
    end

    it "should validate with all validations" do
      @product = Product.new({
        name: "name", 
        price: 100, 
        quantity: 100,
        category: @cat
      })
      expect(@product).to be_valid
    end

    it "should have a valid name" do
      @product = Product.new({
        price: 100, 
        quantity: 100,
        category: @cat
      })
      expect(@product).to_not be_valid
    end

    it "should have a valid price" do
      @product = Product.new({
        name: "name", 
        quantity: 100,
        category: @cat
      })
      expect(@product).to_not be_valid
    end

    it "should have a valid quantity" do
      @product = Product.new({
        name: "name", 
        price: 100,
        category: @cat
      })
      expect(@product).to_not be_valid
    end

    it "should have a valid category" do
      @product = Product.new({
        name: "name", 
        price: 100,
        quantity: 100
      })
      expect(@product).to_not be_valid
    end

  end

end