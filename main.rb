def main
  cart = ShoppingCart.new
end

class ShoppingCart
  attr_accessor :name
  attr_accessor :items
  attr_accessor :balance

  def initialize
    @name = name
    @items = {}
    @balance = 0
    open
  end
  
  def open
    puts "Hello, welcome to Shopping Cart CLI Ultra!"
    print "Please enter your name: "
    name = gets.chomp
    puts ""
    puts "Welcome #{name}! Thanks for using SC CLI Ultra!"
    puts "Let's get started."
    puts ""
    core
  end

  def core
    menu
  end
    
  def menu
    loop do
      puts "Select an option:"
      puts "1) Add item"
      puts "2) Remove item"
      puts "3) View cart"
      puts "4) Balance total"
      puts "5) Empty Cart"
      puts ""
      selection = gets.chomp.to_i
      puts ""
      case selection
        when selection = 1
          puts "+++ Add Item Menu +++\n\n"
          add_item
        when selection = 2
          puts "--- Remove Item Menu ---\n\n"
          remove_item
        when selection = 3
          puts "*** View Cart Contents ***\n\n"
          view_cart 
        when selection = 4
          puts "$$$ View Balance Total $$$\n\n"
          balance_total
        when selection = 5
          puts "... Empty Cart ...\n\n"
          empty_cart
        else
          puts "Please enter a number between 1 - 5.\n\n"
      end
    end
  end

  def add_item
    print "Item name: "
    item_name = gets.chomp
    print "Item price: "
    item_price = gets.chomp.to_f
    item_price = ("%.2f" % item_price).to_f
    print "Item quantity: "
    item_quantity = gets.chomp.to_i
    items[item_name] = [item_price, item_quantity]
    @balance += ("%.2f" % (items[item_name][0]*items[item_name][1])).to_f
    puts ""
  end

  def remove_item
    print "Item name: "
    item_name = gets.chomp
      if items.has_key?(item_name)
        @balance -= ("%.2f" % (items[item_name][0]*items[item_name][1])).to_f
        items.delete(item_name)
        puts "#{item_name} removed from cart.\n\n"
      else
        puts "#{item_name.capitalize} not in cart.\n\n"
      end
  end

  def view_cart
    puts "Items currently in your cart.  "
    puts "name (quantity, item price) [total price]:\n\n"
    items.each_key do |key|
      puts key.to_s + " (" + items[key][1].to_s + ", \$" + ("%.2f" % items[key][0]).to_s + ") " + "[$" + ("%.2f" % (items[key][0]*items[key][1])).to_s + "]"
    end
    puts ""
  end

  def balance_total
    puts "Current cart balance: $#{("%.2f" % balance).to_s}\n\n"
  end

  def empty_cart
    print "Are you sure you want to empty your cart? (y/n)"
    confirm = gets.chomp
    if items.empty?
      puts "Your cart is already empty.\n\n"
    elsif confirm == "y"
      puts "Emptying...\n\n"
        items.each_key do |item|
          items.delete(item)
        end
      balance = 0
      puts "Cart empty!\n\n"
    elsif confirm == "n"
      puts "Returning to menu.\n\n"
    end
  end
end

main
