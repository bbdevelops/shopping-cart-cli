# Shopping Cart CLI Ultra

## Introduction

Shopping Cart Command Line Interface (CLI) Ultra is a tool to keep track of the items in your shopping cart, their prices and quantities, and the total cost of the goods in the cart.

## User Stories
As a shopper, I want to track my costs as I shop, so that I know how much I am spending and what I've already picked out.


## Commands
When prompted to select an option, enter a number 1 - 5, or 0 to quit the program. 

1) Add Item/Change Quantity - Add item to cart. Specify cost per item and number of items. Can also modify item quanity/per item price here.
2) Remove Item - Remove a specific item in the cart entirely.
3) View Cart - See the a list of the contents of your cart with the quantity, per item price and total price for that item (quantity * item price).
4) Balance Total - Shows user the total cash amount of all the items in the cart. 
5) Empty Cart - Remove all items in your cart. Asks you to confirm y/n before empyting.
0) Quit Program - Asks if you are sure. Enter y to confirm exit, and n to go back to the menu.

## Tests
In the /shopping-cart-cli/tests/ folder there is a test file named ```shopping_cart_test.rb``` which offers a number of unit tests for the program. Tests include: cart variable initialization tests and add items/item manipulation tests.

## Functional Requirements
* Must create a ShoppingCart object.
* Said object must store a hash.
* In said hash, the keys are the names of items in the cart and where the values are arrays.
* Said value that contain arrays must contain the price per unit of item associated with key, and the quantity of said item.
* Must show a list of items in cart.
* Must be able to add and remove items from cart.
* Must show the total value of all items in cart when called.
* Must be able to exit the program from within the program, not just Ctrl+C.
* Must make an attempt to incentivize users to stop them from quitting the program.
