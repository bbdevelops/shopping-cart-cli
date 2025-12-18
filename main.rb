def main
  cart = ShoppingCart.new
end

class ShoppingCart
  #attr_accessor :name
  attr_accessor :items
  attr_accessor :balance

  def initialize(skip_menu = false)
    #@name = name
    @items = {}
    @balance = 0
    open unless skip_menu
  end

  def open
    puts "Hello, welcome to Shopping Cart CLI Ultra!"
    #print "Please enter your name: "
    #name = gets.chomp
    #puts ""
    #puts "Welcome #{name}!"
    puts "Let's get started."
    puts ""
    menu
  end

  def menu
    loop do
      puts "Select an option:"
      puts "1) Add Item/Change Quantity"
      puts "2) Remove Item"
      puts "3) View Cart"
      puts "4) Balance Total"
      puts "5) Empty Cart"
      puts "0) Quit Program\n\n"
      selection = gets.chomp.to_i
      puts ""
      case selection
        when 1
          puts "+++ Add Item +++\n\n"
          add_item
        when 2
          puts "--- Remove Item ---\n\n"
          remove_item
        when 3
          puts "*** View Cart ***\n\n"
          view_cart 
        when 4
          puts "$$$ View Balance Total $$$\n\n"
          balance_total
        when 5
          puts "... Empty Cart ...\n\n"
          empty_cart
        when 0
          print "Are you sure you want to quit? (y/n) "
          confirmation = gets.chomp
            if confirmation == "y"
              puts "Goodbye!"
              break
            else
              puts "Returning to menu.\n\n"
            end
        else
          puts "Please enter a number between 1 - 5 or 0.\n\n"
      end
    end
  end

  def add_item
    puts "Add a new item by following the prompts."
    puts "You can also change the quantity of an item already in your cart this way. Make sure you type the item name correctly to update the record."
    print "Item name: "
    item_name = gets.chomp.capitalize
    print "Item price: "
    item_price = gets.chomp.to_f
    item_price = ("%.2f" % item_price).to_f
    print "Item quantity: "
    item_quantity = gets.chomp.to_i
    items[item_name] = [item_price, item_quantity]
    puts ""
  end

  def remove_item
    print "Item name: "
    item_name = gets.chomp.capitalize
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
      if items.empty?
        puts "Your cart is empty.\n\n"
      else
      items.each_key do |key|
        puts key.to_s + " (" + items[key][1].to_s + ", \$" + ("%.2f" % items[key][0]).to_s + ") " + "[$" + ("%.2f" % (items[key][0]*items[key][1])).to_s + "]"
      end
    end
    puts ""
  end

  def balance_total
    balance_total = items.values.sum { |price, qty| price * qty }
    puts "Current cart balance: $#{("%.2f" % balance_total).to_s}\n\n"
  end

  def empty_cart
    print "Are you sure you want to empty your cart? (y/n) "
    confirm = gets.chomp
    if items.empty?
      puts "Your cart is already empty.\n\n"
    elsif confirm == "y"
      puts "Emptying...\n\n"
        items.each_key do |item|
          items.delete(item)
        end
      @balance = 0
      puts "Cart empty!\n\n"
    elsif confirm == "n"
      puts "Returning to menu.\n\n"
    end
  end
end

main
