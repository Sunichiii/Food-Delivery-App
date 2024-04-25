import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Components/my_button.dart';
import 'package:food_delivery/models/resturant.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

   FoodPage({
    super.key,
    required this.food,}){
     // first ma tick mark hudaina
     for (Addon addon in food.availableAddons){
       selectedAddons[addon] = false;
     }
   }

  @override
  State<FoodPage> createState() => _FoodPageState();


}

class _FoodPageState extends State<FoodPage> {
  //method to add to cart
  void addToCart(Food food, Map<Addon, bool>selectedAddons){
    //close the current food page and go abck to menu

    Navigator.pop(context);

    //format the selected addons
    List<Addon>currentlySelectedAddons = [];
    for(Addon addon in widget.food.availableAddons){
      if(widget.selectedAddons[addon] ==  true){
        currentlySelectedAddons.add(addon);
      }
    }
    // add to cart
    context.read<Resturant>().addToCart(food, currentlySelectedAddons);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //food image
              Image.asset(widget.food.imagePath),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(children: [
                  //food name
                  Text(widget.food.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  //food price
                  Text(
                    '\$${widget.food.price}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 10,),
                  //description
                  Text(widget.food.description),

                  const SizedBox(height: 10),

                  Divider(color: Theme.of(context).colorScheme.secondary),

                  const SizedBox(height: 10,),
                  //addons
                  Text("Add-Ons", style:
                  TextStyle(color:
                  Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    decoration:
                    BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount:  widget.food.availableAddons.length,
                      itemBuilder: (context, index){
                        //get individual addons
                        Addon addon = widget.food.availableAddons[index];

                        // return checkbox UI
                        return CheckboxListTile(
                            title: Text(addon.name),
                            subtitle: Text('\$${addon.price}',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            value: widget.selectedAddons[addon],
                            onChanged: (bool? value) {
                              setState(() {
                                widget.selectedAddons[addon] = value!;
                              });
                            }
                        );
                      },
                    ),
                  ),
                ],),
              ),

              //button (add to cart)
              MyButton(
                  onTap: () => addToCart(widget.food, widget.selectedAddons),
                  text: "Add to Cart"),

              const SizedBox(height: 24,)
            ],
          ),
        ),
      ),

      //backbutton
      SafeArea(
        child: Opacity(
          opacity: 0.6,
          child: Container(
            margin: EdgeInsets.only(left: 25),
            decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.pop(context),
          ),),
        ),
      )
    ],);
  }
}
