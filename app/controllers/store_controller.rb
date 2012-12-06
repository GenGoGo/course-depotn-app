class StoreController < ApplicationController
  def index
   # @products = Product.order(:title)
   @products = Product.cheap
  end
end
