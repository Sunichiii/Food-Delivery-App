import 'package:flutter/material.dart';
import 'package:food_delivery/Components/my_receipt.dart';
import 'package:food_delivery/models/resturant.dart';
import 'package:food_delivery/services/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  //getting access ot database

  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();
    // if we get to this page submit order to firestore db
    String receipt = context.read<Resturant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }
}

Widget _buildBottomNavBar(BuildContext context) {
  return Container(
    height: 100,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Added this line
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
        ),

        //driver details
        Column(
          mainAxisAlignment: MainAxisAlignment.center, // Added this line
          children: [
            Text(
              "Snickers Shrestha",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Text(
              "Delivery Guy",
              style: TextStyle(
                color: Colors.grey,
              ),
            )
          ],
        ),

        // Message and Call buttons wrapped in a Row
        Row(
          children: [
            //message button
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.message),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            //CALL BUTTON
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.call),
                color: Colors.green,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
