import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //textstyle

    var myPrimaryTextStyle =
    TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var mySecondaryTextStyle =
    TextStyle(color: Theme.of(context).colorScheme.primary);


    return Padding( // Wrap Container with Padding widget
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 25), // Corrected margin
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //delivery fee
              Column(
                children: [
                  Text('\$0.99',style: myPrimaryTextStyle,),
                  Text('Delivery Fee',style: mySecondaryTextStyle,),
                ],
              ),
              Column(
                children: [
                  Text('15-30 min',style: myPrimaryTextStyle,),
                  Text('Delivery Time',style: mySecondaryTextStyle,),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
