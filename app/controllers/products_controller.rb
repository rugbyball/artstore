class ProductsController < ApplicationController
  #before_action :authenticate_user!

  def index
    #@products = Product.all
    @products = Product.order("id DESC")
    @infos = Info.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    #current_cart.add_product_to_cart(@product)

    if !current_cart.items.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已經成功將 #{@product.title} 加入購物車"
    else
      flash[:warning] = "你的購物車內已有此商品"
    end

    redirect_to :back
  end

end
