import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';
class RecentOrders extends StatelessWidget {
  _buildRecentOrders(BuildContext context, Order order) {
    return Container(
      width: 320,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: Colors.grey[200],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              image: AssetImage(order.food.imageUrl),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
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
                    order.food.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    order.restaurant.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(order.date,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).primaryColor,
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Recent Orders',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.only(start: 10),
            height: 120,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders.length,
              itemBuilder: (BuildContext context, int index) {
                Order order = currentUser.orders[index];
                return _buildRecentOrders(context, order);
              },
            ),
          ),
  
        ],
      ),
    );
  }
}
