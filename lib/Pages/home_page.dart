import 'package:flutter/material.dart';
import 'package:food_delivery/Components/my_current_location.dart';
import 'package:food_delivery/Components/my_description.dart';
import 'package:food_delivery/Components/my_food_tile.dart';
import 'package:food_delivery/Components/my_tab_bar.dart';
import 'package:food_delivery/models/food.dart';
import 'package:provider/provider.dart';
import '../Components/my_drawer.dart';
import '../Components/my_sliverapp_bar.dart';
import '../models/resturant.dart';
import 'food_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  // Declare TabController variable
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  //returning food list belonging to category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category).toList();
  }
  //returning list of food in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category){

      //get category menu

      List<Food> categoryMenu =_filterMenuByCategory(category, fullMenu );

      return ListView.builder(
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
            //get individual food
        final food = categoryMenu[index];

        //return food tile
        return FoodTile(food: food, onTap: () => Navigator.push(context,
            MaterialPageRoute(
            builder: (context)=> FoodPage(food: food),
            ),
        ),
        );
      },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController), // Pass tabController to MyTabBar
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const MyCurrentLocation(),
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Resturant>(
    builder: (context, resturant, child) => TabBarView(
     controller: _tabController,
      children: getFoodInThisCategory(resturant.menu),
      ),
    ),
    )
    );
  }
}
