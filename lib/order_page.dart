import 'package:flutter/material.dart';
import 'Confirmation_Page.dart';

class OrderPage extends StatefulWidget {
  final String itemName;
  final String itemImage;
  final String itemPrice;

  OrderPage({required this.itemName, required this.itemImage, required this.itemPrice});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.itemImage, width: 150, height: 150),
            SizedBox(height: 10),
            Text(widget.itemName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(widget.itemPrice, style: TextStyle(fontSize: 18, color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.remove_circle_outline), onPressed: decreaseQuantity),
                Text('$quantity', style: TextStyle(fontSize: 18)),
                IconButton(icon: Icon(Icons.add_circle_outline), onPressed: increaseQuantity),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationPage(
                      itemName: widget.itemName,
                      itemImage: widget.itemImage,
                      itemPrice: widget.itemPrice,
                    ),
                  ),
                );
              },
              child: Text('Confirm Order'),
            ),
          ],
        ),
      ),
    );
  }
}
