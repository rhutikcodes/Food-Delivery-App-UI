import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order order) {
    return Container(
      height: 170,
      padding: EdgeInsets.all(20),
      child: Expanded(
        child: Row(
          children: <Widget>[
            Container(
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(order.food.imageUrl), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      order.food.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      order.restaurant.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 0.8, color: Colors.black54),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              '-',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            order.quantity.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              '+',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                '\$${order.food.price * order.quantity}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    currentUser.cart.forEach(
        (Order order) => totalPrice += order.quantity * order.food.price);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart(${currentUser.cart.length})'),
      ),
      body: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (index < currentUser.cart.length) {
              Order order = currentUser.cart[index];
              return _buildCartItem(order);
            }
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Delivery Time',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '25 min',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total Cost',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.green[700]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1,
                color: Colors.grey,
              ),
          itemCount: currentUser.cart.length + 1),
      bottomSheet: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(offset: Offset(0, -1), color: Colors.black26),
          ],
        ),
        child: Center(
          child: FlatButton(
            onPressed: () {},
            child: Text(
              'Check Out',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}
