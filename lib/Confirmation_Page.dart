import 'package:flutter/material.dart';
import 'cart_page.dart'; // Pastikan import CartPage

class ConfirmationPage extends StatefulWidget {
  final String itemName;
  final String itemImage;
  final String itemPrice;

  ConfirmationPage({
    required this.itemName,
    required this.itemImage,
    required this.itemPrice,
  });

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  bool isDeliverySelected = false;
  TextEditingController addressController = TextEditingController(); // Controller untuk alamat

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Konfirmasi Pesanan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              // Aksi favorit di sini
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: Text('Dine-in', style: TextStyle(color: isDeliverySelected ? Colors.black : Colors.white)),
                  selected: !isDeliverySelected,
                  selectedColor: Colors.purple,
                  onSelected: (selected) {
                    setState(() {
                      isDeliverySelected = false;
                    });
                  },
                ),
                SizedBox(width: 10),
                ChoiceChip(
                  label: Text('Delivery', style: TextStyle(color: isDeliverySelected ? Colors.white : Colors.black)),
                  selected: isDeliverySelected,
                  selectedColor: Colors.purple,
                  onSelected: (selected) {
                    setState(() {
                      isDeliverySelected = true;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            isDeliverySelected
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: addressController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Masukkan Alamat',
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  )
                : Text(
                    'Outlet : Purwakarta, Bungursari',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(widget.itemImage, width: 100, height: 100),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.itemName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('1 x ${widget.itemName}', style: TextStyle(fontSize: 16)),
                    Text(widget.itemPrice, style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Pesanan Berhasil'),
                        content: Text('Terima kasih telah memesan!'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Buy Now', style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Mengirim data ke CartPage saat tombol Keranjang ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(
                        itemName: widget.itemName,
                        itemImage: widget.itemImage,
                        itemPrice: widget.itemPrice,
                        deliveryAddress: isDeliverySelected ? addressController.text : null,
                      ),
                    ),
                  );
                },
                child: Text('Keranjang', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
