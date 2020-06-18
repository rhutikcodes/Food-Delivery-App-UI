import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_star.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
  RestaurantScreen({this.restaurant});
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  image: AssetImage(widget.restaurant.imageUrl),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  height: 220,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: 35,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '0.2 mile away',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                RatingStar(widget.restaurant.rating),
                SizedBox(
                  height: 6,
                ),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Reviews',
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
              ),
              FlatButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Contact',
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
              )
            ],
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10),
              crossAxisCount: 2,
              children: List.generate(
                widget.restaurant.menu.length,
                (index) {
                  Food menuItem = widget.restaurant.menu[index];
                  return Center(
                      child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        height: 175,
                        width: 175,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(menuItem.imageUrl),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Container(
                        height: 175,
                        width: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.black54.withOpacity(0.3),
                                Colors.black45.withOpacity(0.3),
                                Colors.black38.withOpacity(0.3),
                              ],
                              stops: [
                                0.1,
                                0.4,
                                0.7,
                                0.9,
                              ]),
                        ),
                      ),
                      Positioned(
                        bottom: 65,
                        child: Column(
                          children: <Widget>[
                            Text(
                              menuItem.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$${menuItem.price}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
