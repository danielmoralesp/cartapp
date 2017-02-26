class CartController < ApplicationController

  def add
    id = params[:id]
      #Si el cart ya existe, usar el carrito creado
      if session[:cart] then
        cart = session[:cart]
      else
        session[:cart] = {}
        cart = session[:cart]
      end

      #Si el producto ya esta en el carrito, incrementar la cantidad
      if cart[id] then
        cart[id] = cart[id] + 1
      else
        cart[id] = 1
      end
    redirect_to :action => :index
  end

  def clearCart
    session[:cart] = nil
    redirect_to :action => :index
  end

  def index
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end
end
