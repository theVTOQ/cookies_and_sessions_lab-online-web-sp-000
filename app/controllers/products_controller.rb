class ProductsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def index 
    @cart = cart
    if @cart.nil?
      binding.pry
      @cart = []
    end
    binding.pry
    render "index"
  end
  
  def add_to_cart 
    #session[:cart] << params[:product]
    current_cart = cart
    current_cart << params[:product]
    session[:cart] = current_cart
    redirect_to action: "index"
    #binding.pry
  end 
end
