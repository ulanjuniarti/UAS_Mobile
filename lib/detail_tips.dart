import 'package:flutter/material.dart';

class DetailTipsPage extends StatelessWidget {
  final Map<String, dynamic>? data;

  DetailTipsPage({this.data});

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      // Tampilkan widget lain atau berikan pesan kesalahan jika data null
      return Scaffold(
        body: Center(
          child: Text('Data not available'),
        ),
      );
    }

    String nama = data!['nama'];
    String foto = data!['foto'];
    String deskripsi = data!['deskripsi'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 196, 193),
        title: Text('Lunar Beauty & Health'),
      ),
      body: SingleChildScrollView(
        // Tambahkan widget SingleChildScrollView di sini
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                nama,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Image.network(
                "http://192.168.43.146:8000/storage/images/$foto",
                height: 200.0,
                width: 350.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              Text(
                deskripsi,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify, // Atur textAlign menjadi justify
              ),
            ],
          ),
        ),
      ),
    );
  }
}
