import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SayaPage(),
    );
  }
}

class SayaPage extends StatefulWidget {
  @override
  _SayaPageState createState() => _SayaPageState();
}

class _SayaPageState extends State<SayaPage> {
  String name = 'Zesica Fitriani';
  double balance = 100000.0;
  String address = 'Purwakarta, Bungursari';

  final TextEditingController topUpController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void topUp() {
    setState(() {
      double topUpAmount = double.tryParse(topUpController.text) ?? 0.0;
      balance += topUpAmount;
      topUpController.clear();
    });
  }

  void updateAddress() {
    setState(() {
      address = addressController.text;
      addressController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Text('Saldo: Rp.${balance.toStringAsFixed(0)}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              controller: topUpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Jumlah Top Up',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: topUp,
              child: Text('Top Up'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            SizedBox(height: 20),
            Text('Alamat: $address', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Alamat Baru',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: updateAddress,
              child: Text('Update Alamat'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman riwayat pesanan
                },
                child: Text('Riwayat Pesanan'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    
      
    );
  }
}