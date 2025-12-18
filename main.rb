def main
  cart = ShoppingCart.new
end

class ShoppingCart
  
  attr_accessor :items
  attr_accessor :balance
  attr_accessor :spree_flag
  attr_accessor :exit_offer_flag
  
  def initialize(skip_menu = false)
    @items = {}
    @balance = 0
    @spree_flag = false
    @exit_offer_flag
    open unless skip_menu
  end

def open
  puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  puts "⠀⠛⠻⠶⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  puts "⠀⠀⠀⠀⠈⢻⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀⠀⠀"
  puts "⠀⠀⠀⠀⠀⠀⢻⡏⠉⠉⠉⢹⡏⠉⠉⠉⣿⠉⠉⠉⠉⠉⠉⣹⠇⠀⠀⠀⠀"
  puts "⠀⠀⠀⠀⠀⠀⠈⣿⣀⣀⣀⣸⣧⣀⣀⣀⣿⣀⣀⣀⣀⣀⣠⡿⠀⠀⠀⠀⠀"
  puts "⠀⠀⠀⠀⠀⠀⠀⠸⣧⠀⠀⢸⡇⠀⠀⠀⣿⠀⠀⠀⠀⠀⣿⠃⠀⠀⠀⠀⠀"
  puts "⠀⠀⠀⠀⠀⠀⠀⠀⢹⣤⣤⣼⣧⣤⣤⣤⣿⣤⣤⣤⣤⣼⡏⠀⠀⠀⠀⠀⠀"
  puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⠀⢸⡇⠀⠀⠀⣿⠀⠀⠀⢠⡿⠀⠀⠀⠀⠀⠀⠀"
  puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠷⠼⠷⠤⠤⠤⠿⠤⠤⠤⠾⠃⠀⠀⠀⠀⠀⠀⠀"
  puts "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  puts "⠀⠀⠀⠀⠀⠀⠀⠀⢾⣷⣶⣶⠶⠶⠶⠶⠶⠶⣶⠶⣶⠀⠀⠀⠀⠀⠀⠀⠀"
  puts "⠀⠀⠀⠀⠀⠀⠀⠀⠸⣧⣿⠀⠀⠀⠀⠀⠀⠀⢷⣄⣼⠇⠀⠀⠀⠀⠀⠀⠀"
  puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  puts ""
  puts "Welcome to Shopping Cart CLI Ultra!"
  puts "Let's get started.\n\n"
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
      print "User choice: "
      input = gets.chomp

      if input.downcase == "spree"
        puts "SHOPPING SPREE UNLOCKED!\n\n"
        spree_menu
        next  # Skip the rest and go back to menu
      end

      selection = input.to_i
      puts ""
      case selection
        when 1
          puts "111 Add Item 111\n\n"
          add_item
        when 2
          puts "222 Remove Item 222\n\n"
          remove_item
        when 3
          puts "333 View Cart 333\n\n"
          view_cart 
        when 4
          puts "444 View Balance Total 444\n\n"
          balance_total
        when 5
          puts "555 Empty Cart 555\n\n"
          empty_cart
        when 0
          print "Are you sure you want to quit? (y/n) "
          confirmation = gets.chomp.downcase
            if confirmation == "y" && @exit_offer_flag
                goodbye_cart
                break
            elsif confirmation == "y"
              print "Are you REALLY sure you want to quit? (y/n) "
              really_check = gets.chomp.downcase
              if @spree_flag 
                goodbye_cart
                break
              end
              if really_check == "y"
                print "What if we offered you an all expenses paid shopping spree? Would you still leave? (y/n) "
                spree_check = gets.chomp.downcase
                  if spree_check == "y"
                    goodbye_cart
                    break
                  elsif spree_check == "n"
                    @exit_offer_flag = true
                    spree_menu
                end
              end
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
      if items[item_name][0] <= 0 || items[item_name][1] <= 0
        items.delete(item_name)
        puts "Invalid price or quantity, item input cancelled."
      end
    puts ""
  end

  def remove_item
    puts "Remove an item from your shopping cart."
    if @spree_flag
      puts "NOTE: Removing final item will remove your shopping spree discount! " 
    end
    print "Item name: "
    item_name = gets.chomp.capitalize
      if items.has_key?(item_name)
        @balance -= ("%.2f" % (items[item_name][0]*items[item_name][1])).to_f
        items.delete(item_name)
        puts "#{item_name} removed from cart.\n\n"
      else
        puts "#{item_name.capitalize} not in cart.\n\n"
      end
      if items.empty?
        @spree_flag = false
      end
  end

  def view_cart
    puts "Items currently in your cart.  "
    puts "name (quantity, item price) [total price]:\n\n"
      if items.empty?
        puts "Your cart is empty.\n"
      else
      items.each_key do |key|
        puts key.to_s + " (" + items[key][1].to_s + ", $" + ("%.2f" % items[key][0]).to_s + ") " + "[$" + ("%.2f" % (items[key][0]*items[key][1])).to_s + "]"
      end
    end
    puts ""
  end

  def balance_total_calc
    items.values.sum { |price, qty| price * qty }
  end

  def balance_total
    total = balance_total_calc
    if spree_flag == false
      puts "Current cart balance: $#{("%.2f" % total).to_s}\n\n"
    else
      puts "Current cart balance: $0.00 ($#{("%.2f" % total).to_s} without SHOPPING SPREE DISCOUNT)\n\n"
    end
  end

  def empty_cart
    print "Are you sure you want to empty your cart? (y/n) "
    if @spree_flag
      puts "NOTE: This will remove your shopping spree discount! " 
    end
    confirm = gets.chomp.downcase
    if items.empty?
      puts "\nYour cart is already empty.\n\n"
    elsif confirm == "y"
      puts "Emptying...\n\n"
        items.each_key do |item|
          items.delete(item)
        end
      @balance = 0
      puts "Cart empty!\n\n"
      @spree_flag = false
    elsif confirm != "y"
      puts "Returning to menu.\n\n"
    end
  end

  def spree_menu
    print "\nSTART SHOPPING SPREE? (y/n) "
    confirm = gets.chomp.downcase
    
    if confirm == "y"
      puts "FILLING YOUR CART WITH ITEMS!"
      puts "Shopping... shopping... shopping...\n\n"
      shopping_spree
      puts "Added 50 random items to your cart!"
      puts "Total balance: $#{"%.2f" % balance_total_calc}\n\n"
      @spree_flag = true
    else
      puts "Maybe next time!\n\n"
    end
  end

  def shopping_spree
    item_names = [
      "Apple", "Banana", "Orange", "Grape", "Mango", 
      "Strawberry", "Blueberry", "Raspberry", "Blackberry", "Pineapple",
      "Watermelon", "Cantaloupe", "Honeydew", "Kiwi", "Peach",
      "Pear", "Plum", "Cherry", "Apricot", "Papaya",
      "Tomato", "Lettuce", "Carrot", "Potato", "Onion",
      "Broccoli", "Cauliflower", "Spinach", "Kale", "Cucumber",
      "Bell Pepper", "Zucchini", "Eggplant", "Celery", "Radish",
      "Asparagus", "Cabbage", "Corn", "Peas", "Green Beans",
      "Milk", "Cheese", "Butter", "Eggs", "Yogurt",
      "Cream", "Sour Cream", "Cottage Cheese", "Cream Cheese", "Mozzarella",
      "Cheddar", "Parmesan", "Ice Cream", "Whipped Cream", "Buttermilk",
      "Chicken", "Beef", "Pork", "Turkey", "Lamb",
      "Salmon", "Tuna", "Shrimp", "Cod", "Tilapia",
      "Bacon", "Ham", "Sausage", "Ground Beef", "Steak",
      "Bread", "Bagel", "Croissant", "Muffin", "Donut",
      "Baguette", "Roll", "Pita", "Tortilla", "English Muffin",
      "Sourdough", "Rye Bread", "Wheat Bread", "Bun", "Pretzel",
      "Pasta", "Rice", "Flour", "Sugar", "Salt",
      "Pepper", "Oil", "Vinegar", "Honey", "Maple Syrup",
      "Peanut Butter", "Jam", "Ketchup", "Mustard", "Mayonnaise",
      "Soy Sauce", "Hot Sauce", "Olive Oil", "Balsamic", "Cereal",
      "Chips", "Cookies", "Crackers", "Popcorn", "Pretzels",
      "Candy", "Chocolate", "Granola Bar", "Trail Mix", "Nuts",
      "Almonds", "Cashews", "Peanuts", "Pistachios", "Gummy Bears",
      "Chocolate Bar", "Lollipop", "Caramel", "Licorice", "Jerky",
      "Coffee", "Tea", "Juice", "Soda", "Water",
      "Energy Drink", "Sports Drink", "Lemonade", "Iced Tea", "Hot Chocolate",
      "Apple Juice", "Orange Juice", "Cranberry Juice", "Grape Juice", "Milk Shake",
      "Smoothie", "Kombucha", "Sparkling Water", "Coconut Water", "Almond Milk",
      "Pizza", "French Fries", "Chicken Nuggets", "Burrito", "Waffle",
      "Frozen Vegetables", "Frozen Fruit", "Fish Sticks", "Tater Tots", "Onion Rings",
      "Popsicle", "Frozen Dinner", "Frozen Pancakes", "Ice Cream Sandwich", "Drumstick",
      "Soap", "Shampoo", "Conditioner", "Toothpaste", "Toothbrush",
      "Tissue", "Towel", "Toilet Paper", "Paper Towel", "Laundry Detergent",
      "Dish Soap", "Sponge", "Trash Bags", "Aluminum Foil", "Plastic Wrap",
      "Bleach", "All-Purpose Cleaner", "Glass Cleaner", "Disinfectant", "Air Freshener",
      "Deodorant", "Body Wash", "Face Wash", "Lotion", "Sunscreen",
      "Chapstick", "Hand Sanitizer", "Cotton Swabs", "Band-Aids", "Razor",
      "Shaving Cream", "Hair Gel", "Hair Spray", "Nail Polish", "Makeup Remover",
      "Moisturizer", "Face Mask", "Dental Floss", "Mouthwash", "Perfume",
      "Shirt", "Pants", "Shorts", "Dress", "Skirt",
      "Jacket", "Sweater", "Hoodie", "Jeans", "Socks",
      "Underwear", "Bra", "Tie", "Scarf", "Gloves",
      "Hat", "Cap", "Beanie", "Belt", "Shoes",
      "Phone", "Charger", "Headphones", "Earbuds", "Speaker",
      "Mouse", "Keyboard", "Monitor", "Laptop", "Tablet",
      "USB Cable", "Power Bank", "Phone Case", "Screen Protector", "Webcam",
      "Microphone", "Router", "HDMI Cable", "Flash Drive", "Hard Drive"
    ]
    
    50.times do
      name = item_names.sample
      price = (rand(50.0 - 0.5) + 0.5).round(2)
      quantity = rand(1..10)
      items[name] = [price, quantity]
    end
  end
    def goodbye_cart
    puts ""
    puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠴⠒⠤⣄⡀⠀⠀⠀⠀⢠⣾⠉⠉⠉⠉⠑⠒⠦⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀      "
    puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠋⠀⠀⠀⠀⠀⠉⠲⡄⠀⢠⠏⡏⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       "
    puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⢤⣤⣀⡀⠀⠀⠀⠀⠀⢰⡏⠀⠀⠀⠀⠀⠀⠀⠀⠘⢆⢸⠀⡇⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀      "
    puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠏⠀⠀⠀⠀⠈⠙⠢⣄⠀⠀⣿⠀⠀⠀⢰⣿⣷⣆⠀⠀⠀⠘⣾⠀⠇⠀⠀⠀⢾⣿⣿⣦⢀⠀⠀⠀⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀      "
    puts "⠀⠀⠀⠀⠀⢀⣀⡤⣄⠀⠀⠀⣼⡇⠀⠀⠀⢀⣀⠀⠀⠀⠈⠳⣴⢿⡄⠀⠀⢸⡿⣿⣿⠀⠀⠀⠀⣿⠀⡆⠀⠀⠀⣼⣿⣯⣻⠀⠀⠀⠀⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     "
    puts "⠀⠀⢀⡴⠚⠉⠀⠀⠈⠳⡄⠀⣿⡇⠀⠀⠀⣿⣿⣷⡄⠀⠀⠀⢹⣆⢧⠀⠀⠀⠙⠿⠋⠀⠀⠀⠀⣿⠀⡇⠀⠀⠀⠙⠛⠉⠁⠀⠀⠀⢠⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    "
    puts "⠀⢠⠟⠀⠀⠀⠀⢀⣤⣾⣷⣀⡇⢣⠀⠀⠀⢻⣟⣿⣷⠀⠀⠀⠈⣿⣾⣆⠀⠀⠀⠀⠀⠀⠀⠀⣸⢿⢰⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     "
    puts "⣠⡏⠀⠀⠀⣼⣟⣿⣿⡿⠛⠉⢻⣞⣧⠀⠀⠀⠉⠛⠁⠀⠀⠀⠀⡿⣿⣿⣦⣀⠀⠀⠀⠀⣠⣾⡏⢸⣠⣧⣤⣄⣤⣤⣤⣤⣤⣴⣾⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ⠀"
    puts "⣿⠀⠀⠀⢸⢻⣿⠛⠁⠀⠀⠀⠀⠻⣯⣷⣄⠀⠀⠀⠀⠀⠀⢀⣼⠁⠘⠿⣿⣿⣻⣿⣿⣿⣿⠏⠀⣾⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   "
    puts "⣿⣇⠀⠀⠈⢿⣿⢧⣴⣶⡆⠀⠀⠀⢿⣿⣿⢳⢦⣤⣤⣤⣶⣿⠟⠀⠀⠀⠀⠉⠉⠛⠋⢩⡤⠖⠒⠛⠛⡿⢁⣾⠋⠉⠉⠉⠉⠉⠉⠉⠉⢉⣿⣿⠀⠀⠀"
    puts "⣟⢿⣆⠀⠀⠀⠙⠻⠿⠛⠃⠀⠀⠀⣸⡙⠻⢿⣿⣿⣿⣿⠿⠋⠀⣀⡤⠤⠒⠚⠳⣄⢠⣿⠁⠀⠀⠀⣠⠇⡏⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡏⠀  "
    puts "⠘⣿⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀⣀⣼⣿⠇⠀⠀⠀⣀⣀⣀⠀⢀⣼⣿⣦⡀⠀⠀⠀⠈⢻⡏⠀⠀⠀⠀⣾⠃⡇⣻⢸⠀⠀⠀⢰⣾⣶⣶⣶⣶⣾⡏⠀⠀ "
    puts "⠀⠈⠻⣿⣿⣿⣶⢶⡶⡶⣶⣾⣿⡿⠋⣠⠴⠚⠉⠁⠀⠉⠙⠺⡿⢿⣧⣅⠀⠀⠀⠀⠀⠀⠀⢠⠋⣾⠃⢸⠀⣸⠀⠀⠀⠀⠘⠛⠛⠿⠿⢿⡏⠀⠀⠀"
    puts "⠀⠀⠀⠈⠙⠻⠿⠼⠽⠿⠿⠟⠋⢰⡟⠁⠀⠀⢀⣤⣄⡀⠀⠀⠹⡆⠙⢿⣿⣷⡀⠀⠀⠀⠀⣘⣼⠃⠀⢸⠃⢾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀   "
    puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾⢳⡀⠀⠀⠈⢿⡿⠇⠀⠀⣼⠃⠀⠀⠙⢿⣿⣿⣧⠀⠀⠀⠈⡇⠀⠀⡇⡸⠀⠀⠀⢰⣶⣤⣤⣤⣼⠃⠀⠀    "
    puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⠀⢣⠀⠀⠀⠀⠀⠀⠀⠈⠋⠉⠲⣄⠀⠀⠙⢿⠸⣿⠀⠀⠀⢳⠀⠀⡇⢰⠁⠀⠀⠸⣿⣿⣿⣿⣃⠀⠀⠀    "
    puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣆⠈⣇⠀⠀⠀⠀⣠⣤⣀⠀⠀⠀⠘⣆⠀⠀⠸⡄⢻⡄⠀⠀⠸⡆⢰⡎⣧⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀    "
    puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠘⡄⠀⠀⠀⢻⣿⣿⠆⠀⠀⠀⢸⠀⠀⠀⣇⠘⡿⠀⢀⣀⣧⢸⢁⣿⣶⣤⣤⣤⣀⣀⣀⠀⢀⡏⠀⠀⠀⠀   "
    puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡄⠹⡄⠀⠀⠈⠉⠁⠀⠀⠀⣠⡾⠀⠀⠀⢹⢀⣿⣿⣿⡿⠃⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀   "
    puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⠀⠹⡄⠀⠀⠀⢀⣠⣴⣾⣿⠃⠀⠀⠀⠘⠿⠟⠛⠛⠁⠀⠀⠀⠉⠉⠉⠛⠛⠛⠿⠟⠁⠀⠀      "
    puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⠀⢳⣴⣶⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀             "
    puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣦⣿⣿⡿⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        "
    puts ""
    puts "Thanks for shopping! Goodbye!"
    end
end

main
