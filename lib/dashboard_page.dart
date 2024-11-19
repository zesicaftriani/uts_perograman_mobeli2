import 'package:flutter/material.dart';
import 'order_page.dart';
import 'SayaPage.dart';  // Import halaman SayaPage

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan berdasarkan index
  final List<Widget> _pages = [
    DashboardPage(),  // Halaman Beranda
    MenuPage(),       // Halaman Menu
    SayaPage(),       // Halaman Profil
  ];

  // Fungsi untuk mengubah halaman ketika item dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Temukan Makanan Terbaikmu',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex], // Menampilkan halaman sesuai dengan indeks
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Menampilkan item yang aktif
        onTap: _onItemTapped, // Fungsi yang dipanggil saat item diklik
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Keranjang'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  void navigateToOrder(BuildContext context, String item, String image, String price) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(
          itemName: item,
          itemImage: image,
          itemPrice: price,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_circle, size: 40),
                SizedBox(width: 10),
                Text(
                  'Hi, Zesica',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Makanan Populer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  foodItem(context, 'Ramen', 'assets/ramen.jpg', '25k'),
                  SizedBox(width: 10),
                  foodItem(context, 'Tamago', 'assets/tamago.jpg', '5k'),
                  SizedBox(width: 10),
                  foodItem(context, 'Taiyaki', 'assets/taiyaki.jpg', '10k'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Paket Hemat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => navigateToOrder(context, 'Combo Sushi', 'assets/paket.jpg', 'Rp. 250.000'),
              child: Card(
                child: ListTile(
                  leading: Image.asset('assets/paket.jpg', height: 50, width: 50),
                  title: Text('Combo Sushi'),
                  subtitle: Text('Rp. 250.000'),
                  trailing: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodItem(BuildContext context, String name, String image, String price) {
    return GestureDetector(
      onTap: () => navigateToOrder(context, name, image, price),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            padding: EdgeInsets.all(8),
            child: Image.asset(image, height: 60, width: 60),
          ),
          SizedBox(height: 5),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(price, style: TextStyle(color: Colors.grey)),
          Icon(Icons.add, color: Colors.purple),
        ],
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Halaman Keranjang', style: TextStyle(fontSize: 24)));
  }
}
