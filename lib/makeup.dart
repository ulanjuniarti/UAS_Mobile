import 'package:flutter/material.dart';

class Makeup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips Makeup Tahan Lama'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian Foto
              Image.network(
                'https://akcdn.detik.net.id/visual/2023/01/17/1374583158-1_169.jpeg?w=650',
                height: 200, // Sesuaikan dengan kebutuhan Anda
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0), // Beri sedikit jarak antara gambar dan teks

              // Subjudul yang bold
              Text(
                '1. Setting Powder Sebagai Sentuhan Akhir',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0), // Beri sedikit jarak antara subjudul dan teks

              // Teks
              Text(
                'Setting powder atau bedak tabur yang diformulasikan dengan sifat mattifying adalah bedak tabur yang dapat membantu mencegah makeup luntur. Aplikasikan beda tabur sesuai warna kulit pada langkah terakhir proses makeup.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0), // Tambahkan jarak antara teks sebelumnya dan setelahnya

              Text(
                '2. Gunakan Setting Spray',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0), // Beri sedikit jarak antara subjudul dan teks

              // Teks
              Text(
                'Bagimu yang memiliki kulit kering, mengaplikasikan setting spray sebagai tahap akhir makeup lebih baik daripada menggunakan setting powder. Kelembapan yang diberikan setelah menggunakan setting spray dapat membantu makeup lebih tahan lama.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0), // Tambahkan jarak antara teks sebelumnya dan setelahnya

              Text(
                '3. Hindari Menggunakan Makeup dengan Banyak Lapisan',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0), // Beri sedikit jarak antara subjudul dan teks

              // Teks
              Text(
                'Hindari menggunakan foundation tebal dan kental. Lapisan foundation yang tebal tidak akan menempel pada kulit wajah dengan baik, bahkan akan luntur setelah beberapa jam diaplikasikan.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0), // Tambahkan jarak antara teks sebelumnya dan setelahnya

              Text(
                '4. Eksfoliasi Wajah Secara Rutin',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0), // Beri sedikit jarak antara subjudul dan teks

              // Teks
              Text(
                'Kulit wajah yang kering dan memiliki banyak sel kulit mati tidak akan membuat makeup tahan lama. Lakukan eksfoliasi sesuai kebutuhan kulit agar kulit wajah menjadi sehat dan bersih.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0), // Tambahkan jarak antara teks sebelumnya dan setelahnya

              Text(
                '5. Gunakan Primer Sebelum Mengaplikasikan Riasan',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0), // Beri sedikit jarak antara subjudul dan teks

              // Teks
              Text(
                'Setelah menggunakan rangkaian skincare rutinmu, aplikasikanlah primer sebelum mulai mengaplikasikan riasan. Primer dapat membantu mengunci kelembapan kulit dan membuat foundation lebih menempel pada kulit.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                '6. Gunakan Produk Sesuai Jenis Kulit',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0), // Beri sedikit jarak antara subjudul dan teks

              // Teks
              Text(
                'Hal utama untuk menjaga makeup tahan lama adalah dengan menggunakan produk yang diformulasikan sesuai jenis kulitmu. Bila kulit wajahmu termasuk jenis kulit kering, pakailah produk yang menghidrasi kulit. Kamu bisa memilih foundation cair yang memiliki kandungan hyaluronic acid. Bila jenis kulit wajahmu adalah kulit berminyak, gunakan foundation yang memiliki kandungan salicylic acid yang dapat membantu mengontrol produksi minyak pada kulit.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}