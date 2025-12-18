require 'minitest/autorun'
require_relative '../main'

class TestShoppingCart < Minitest::Test
  
  def test_initialization
    cart = ShoppingCart.new(true)
    
    assert_equal({}, cart.items, "Items should start as empty hash")
    
    assert_equal 0, cart.balance, "Balance should start at 0"
  end
  
  def test_add_item_to_hash
    cart = ShoppingCart.new(true)
    
    cart.items["Apple"] = [1.50, 3]
    cart.balance += (1.50 * 3)
    
    assert cart.items.has_key?("Apple"), "Apple should be in cart"
    
    assert_equal 1.50, cart.items["Apple"][0], "Apple price should be 1.50"
    
    assert_equal 3, cart.items["Apple"][1], "Apple quantity should be 3"
    
    assert_equal 4.50, cart.balance, "Balance should be 4.50"
  end
  
end
