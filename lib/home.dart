import 'package:flutter/material.dart';
// import 'api_manager.dart';
// import 'dashboard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lunar Beauty',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Color.fromARGB(255, 235, 215, 198),
      ),
      backgroundColor: Color(0xFFE2E2E2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      'assets/alat-kecantikan.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Your Beauty Journey Starts Here',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _buildCard('Make up', 'makeup.jpg'),
                  ),
                  Expanded(
                    child: _buildCard('Skincare', 'skincare.jpg'),
                  ),
                  Expanded(
                    child: _buildCard('Body', 'bodycare.jpg'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _buildCard('Hair', 'hair.jpg'),
                  ),
                  Expanded(
                    child: _buildCard('Nails', 'nails.jpg'),
                  ),
                  Expanded(
                    child: _buildCard('Health', 'health.jpg'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 235, 215, 198), // Set the background color to pink
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        onTap: (index) {
          // Handle navigation to different pages based on index
          switch (index) {
            case 0:
              // Navigate to Home
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
              // Navigate to Dashboard
                Navigator.pushReplacementNamed(context, '/dashboard');
              break;
            case 2:
              // Navigate to User
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserPage()),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildCard(String title, String imageUrl) {
    return Column(
      children: [
        Card(
          elevation: 3.0,
          color: Colors.blueGrey[100],
          child: Container(
            height: 80.0,
            width: 80.0,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
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