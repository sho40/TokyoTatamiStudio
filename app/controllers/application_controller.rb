class ApplicationController < ActionController::Base
  protect_from_forgery :expect => [:delete_item]

  helper_method :current_cart

  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
      @cart
    end
  end

end
