require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "validates presents of attributs" do
	product = Product.new
	assert product.invalid?
	assert product.errors[:title].any?
	assert product.errors[:description].any?
	assert product.errors[:price].any?
  end
  
  test "validates price" do
	product = Product.new(  :title => "Alicen",  :description => "Alice description", :image_url => "some.gif")
	assert product.invalid?
	product.price = -1
	assert product.errros[:price].any?
	product.price = 2
	assert product.errors[:price].any?
  end
  
  test "validate uniq" do
	product = Product.new(  :title => "Alicen",  :description => "Alice description", :image_url => "some.gif", :price => "100.00")
	
	product.title = product(:alice).title
	assert !product.save
  end
end
