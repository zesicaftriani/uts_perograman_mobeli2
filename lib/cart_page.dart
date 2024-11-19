import 'package:flutter/material.dart';

// CartPage menerima data dari halaman sebelumnya
class CartPage extends StatelessWidget {
  final String itemName;
  final String itemImage;
  final String itemPrice;
  final String? deliveryAddress; // Alamat bisa null jika Dine-in

  // Konstruktor CartPage untuk menerima data
  CartPage({
    required this.itemName,
    required this.itemImage,
    required this.itemPrice,
    this.deliveryAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Belanja'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Item dalam Keranjang',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Image.asset(itemImage, width: 100, height: 100),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(itemName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('1 x $itemName', style: TextStyle(fontSize: 16)),
                    Text(itemPrice, style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            if (deliveryAddress != null)
              Text(
                'Alamat Pengiriman: $deliveryAddress',
                style: TextStyle(fontSize: 16),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Bisa ditambahkan logika untuk proses checkout atau pembayaran
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Checkout'),
                      content: Text('Proses checkout berhasil.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Checkout', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
