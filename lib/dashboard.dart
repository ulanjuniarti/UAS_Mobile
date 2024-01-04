import 'package:flutter/material.dart';
import 'nailart.dart';
import 'makeup.dart';
import 'rambut.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 235, 215, 198),
        title: Text('Lunar Beauty'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  CardColumn(
                    imageUrl:
                        'https://i.pinimg.com/564x/01/19/23/011923be40611f4ff282f5abfc88114c.jpg',
                    description:
                        'Anti Gagal, Tips Mudah Membuat Nail Art Sendiri di Rumah',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NailArtPage()),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  CardColumn(
                    imageUrl:
                        'https://meltonlearning.com.au/wp-content/uploads/2020/12/GettyImages-167157698.jpg',
                    description: 'Tips Menjaga Makeup Tahan Lama Seharian',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Makeup()),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  CardColumn(
                    imageUrl:
                        'https://image.popbela.com/content-images/post/20211015/1-5135fcce64dcbcf3c8e96cc2b392ee43.jpg?width=1600&format=webp&w=1600',
                    description:
                        'Tips dan Cara Mewarnai Rambut Sendiri di Rumah',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WarnaRambut()),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  // ... tambahkan card lainnya sesuai kebutuhan
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Handle navigation to different pages based on index
            switch (index) {
              case 0:
                // Navigate to Home (DashboardPage)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
                break;
              case 1:
                // Navigate to Tambah Data
                // Replace the print statement with your navigation logic
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
                break;
              case 2:
                // Navigate to User
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => UserPage()),
                );
                break;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Tambah Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }
}

class CardColumn extends StatelessWidget {
  final String imageUrl;
  final String description;
  final VoidCallback? onPressed;

  CardColumn({
    required this.imageUrl,
    required this.description,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                imageUrl,
                height: 200.0,
                width: 350.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: Center(
        child: Text('User Page'),
      ),
    );
  }
}
