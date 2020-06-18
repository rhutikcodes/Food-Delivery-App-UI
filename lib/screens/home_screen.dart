import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/screens/cart_screen.dart';
import 'package:flutter_food_delivery_ui/screens/restaurant_screen.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_star.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildNearByRestaurants() {
    List<Widget> _restaurantsList = [];

    restaurants.forEach((Restaurant restaurant) {
      _restaurantsList.add(GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RestaurantScreen(restaurant: restaurant),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.grey[200]),
          ),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: restaurant.imageUrl,
                  child: Image(
                    image: AssetImage(restaurant.imageUrl),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        restaurant.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      RatingStar(restaurant.rating),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        restaurant.address,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '0.2 miles away',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    });

    return Column(children: _restaurantsList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => CartScreen())),
            child: Text(
              'Cart(${currentUser.cart.length})',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
        title: Text('Food Delivery'),
        leading: Icon(
          Icons.account_circle,
          size: 30,
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0.8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        width: 0.8, color: Theme.of(context).primaryColor),
                  ),
                  hintText: 'Search Food or Resturants',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  suffixIcon: Icon(Icons.clear)),
            ),
          ),
          RecentOrders(),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Nearby Restaurants',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2),
                  ),
                ),
                _buildNearByRestaurants(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
