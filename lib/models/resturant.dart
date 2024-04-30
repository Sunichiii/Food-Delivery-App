import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Resturant extends ChangeNotifier {
  //list
  final List<Food> _menu = [
    //burgers ko lagii
    Food(
        name: "Classic Cheeseburger",
        description:
            "A juicy beef patty with melted, cheddar, lettuce,tomato,a hint of onion and pickle",
        imagePath: "lib/images/burgers/cheese_burger.jpg",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avocado", price: 2.99),
        ]),
    Food(
      name: "Beef Burger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, a hint of onion, and pickle",
      imagePath: "lib/images/burgers/buff_burger.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Ham Burger",
      description:
          "A succulent ham patty with melted cheddar, lettuce, tomato, a hint of onion, and pickle",
      imagePath: "lib/images/burgers/ham_burger.jpg",
      price: 1.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Pineapple", price: 1.49),
      ],
    ),
    Food(
      name: "Pork Burger",
      description:
          "A flavorful pork patty with melted cheddar, lettuce, tomato, a hint of onion, and pickle",
      imagePath: "lib/images/burgers/pork_burger.jpg",
      price: 1.29,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "BBQ Sauce", price: 0.49),
        Addon(name: "Jalapenos", price: 0.79),
      ],
    ),
    // desserts ko lagi
    Food(
      name: "21 Love",
      description:
          "A delightful mix of chocolate and vanilla ice cream, topped with whipped cream and cherries",
      imagePath: "lib/images/desserts/21_love.jpg",
      price: 3.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Chocolate syrup", price: 0.49),
        Addon(name: "Caramel syrup", price: 0.49),
        Addon(name: "Nuts", price: 0.79),
      ],
    ),
    Food(
      name: "Cake",
      description: "A rich and moist cake, perfect for any occasion",
      imagePath: "lib/images/desserts/cake.jpg",
      price: 4.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla frosting", price: 1.29),
        Addon(name: "Chocolate frosting", price: 1.29),
        Addon(name: "Fresh fruits", price: 1.99),
      ],
    ),
    Food(
      name: "Chocolate Ice Cream",
      description: "Creamy chocolate ice cream served in a crispy waffle cone",
      imagePath: "lib/images/desserts/ices_chocolate.jpg",
      price: 2.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Sprinkles", price: 0.29),
        Addon(name: "Chocolate chips", price: 0.49),
        Addon(name: "Whipped cream", price: 0.79),
      ],
    ),
    Food(
      name: "Strawberry Ice Cream",
      description:
          "Refreshing strawberry ice cream served in a crispy waffle cone",
      imagePath: "lib/images/desserts/strawberry_icecream.jpg",
      price: 2.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Fresh strawberries", price: 0.99),
        Addon(name: "Chocolate syrup", price: 0.49),
        Addon(name: "Whipped cream", price: 0.79),
      ],
    ),
    //drinks ko lagi
    Food(
      name: "Champagne",
      description: "Sparkling champagne to celebrate any occasion",
      imagePath: "lib/images/drinks/champagne.jpg",
      price: 9.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Orange juice", price: 1.49),
        Addon(name: "Strawberries", price: 2.99),
        Addon(name: "Mint leaves", price: 0.99),
      ],
    ),
    Food(
      name: "Cocktail",
      description: "Exotic cocktail with a mix of tropical flavors",
      imagePath: "lib/images/drinks/cocktail.jpg",
      price: 7.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Umbrella", price: 0.49),
        Addon(name: "Pineapple slice", price: 0.29),
        Addon(name: "Maraschino cherry", price: 0.39),
      ],
    ),
    Food(
      name: "Colohne",
      description:
          "A unique blend of citrus and herbs, perfect for a refreshing drink",
      imagePath: "lib/images/drinks/colohne.jpg",
      price: 5.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Lemon twist", price: 0.49),
        Addon(name: "Basil leaves", price: 0.79),
        Addon(name: "Cucumber slices", price: 0.59),
      ],
    ),
    Food(
      name: "Pomogranny",
      description: "Tangy pomegranate mixed with sweet granny smith apples",
      imagePath: "lib/images/drinks/pomogranny.jpg",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Pomegranate seeds", price: 0.99),
        Addon(name: "Apple slices", price: 0.69),
        Addon(name: "Honey drizzle", price: 0.49),
      ],
    ),

    //sides kko lagi
    Food(
      name: "Egg",
      description: "Perfectly boiled egg, great as a side or a snack",
      imagePath: "lib/images/sides/egg.jpg",
      price: 1.29,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Salt", price: 0.10),
        Addon(name: "Black pepper", price: 0.15),
        Addon(name: "Hot sauce", price: 0.25),
      ],
    ),
    Food(
      name: "Fries",
      description: "Golden crispy fries, a classic side dish",
      imagePath: "lib/images/sides/fries.jpg",
      price: 2.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Ketchup", price: 0.20),
        Addon(name: "Mayonnaise", price: 0.30),
        Addon(name: "Cheese sauce", price: 0.50),
      ],
    ),
    Food(
      name: "Noodles",
      description: "Stir-fried noodles with vegetables, a tasty side option",
      imagePath: "lib/images/sides/noodles.jpg",
      price: 3.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Chicken", price: 1.99),
        Addon(name: "Shrimp", price: 2.49),
        Addon(name: "Tofu", price: 1.79),
      ],
    ),
    Food(
      name: "Steak",
      description: "Juicy grilled steak, a hearty side dish",
      imagePath: "lib/images/sides/steak.jpg",
      price: 5.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Mushroom sauce", price: 1.49),
        Addon(name: "Garlic butter", price: 0.99),
        Addon(name: "Grilled onions", price: 0.79),
      ],
    ),
  ];

  //GETTERS

  List<Food> get menu => _menu;

  List<CartItem> get cart => _cart;

  String get deliveryAddress => _deliveryAddress;

  //OPERATIONS

  // user cart
  final List<CartItem> _cart = [];

  //delivery address(user can update)
  String _deliveryAddress = "Enter your location";

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is a cart item arlaeady with the same food and addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
// check if there are same food items
      bool isSameFood = item.food == food;
      // check if the lisr of selected addons are same

      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });
    // if the items arleady exists increase the quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise , add a new cart item in the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

//remove the cart

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

//total price of the carts
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

//get the total number of item in the cart

  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

//clearing the cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

//update address

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //HELPERS
  //generating a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //formattting the date
    String formattedDate =
        DateFormat('yyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("_______________________________________________");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("_______________________________________________");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Cost: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");
    return receipt.toString();
  }

  //formating value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //format list of addons into string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(",");
  }
}
