import 'package:flutter/material.dart';

class WarnaRambut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cara Mewarnai Rambut'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian Foto
              Image.network(
                'https://imgsrv2.voi.id/ZBawvGO0rkgv932Sk1cF9cuAgPib7GlXTG9vQyZ9RIk/auto/1200/675/sm/1/bG9jYWw6Ly8vcHVibGlzaGVycy8yMzQ2MDEvMjAyMjEyMDkxNDQ3LW1haW4uanBn.jpg',
                height: 200, // Sesuaikan dengan kebutuhan Anda
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0), // Beri sedikit jarak antara gambar dan teks

              // Subjudul yang bold
              Text(
                '1. Tentukan Dulu Warna yang Cocok untuk Kamu',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0), // Beri sedikit jarak antara subjudul dan teks

              // Teks
              Text(
                'Langkah yang paling utama dan yang paling penting adalah mengetahui jenis warna yang kamu inginkan. Usahakan ketika ingin mewarnai rambut, kamu benar-benar memilih warna yang diinginkan.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0), // Tambahkan jarak antara teks sebelumnya dan setelahnya

              Text(
                '2. Gunakan Mangkuk dan Kuas',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0), // Beri sedikit jarak antara subjudul dan teks

              // Teks
              Text(
                'Pastikan kamu sudah memiliki mangkok dan kuas untuk mengecat rambut seperti layaknya di salon. Tujuannya agar cat tidak berantakan dan untuk memudahkan proses mencampur pewarna.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0), // Tambahkan jarak antara teks sebelumnya dan setelahnya

              Text(
                '3. Cuci Rambut Dua Hari sebelum Pewarnaan',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0), // Beri sedikit jarak antara subjudul dan teks

              // Teks
              Text(
                'Pencucian rambut ditujukan agar cat yang kamu gunakan lebih menyatu dengan rambut asli ketika proses pewarnaan dilakukan. Mencuci rambut sehari sebelum proses pewarnaan juga membuat warna rambut baru akan lebih bertahan lama. ',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0), // Tambahkan jarak antara teks sebelumnya dan setelahnya

              Text(
                '4. Sediakan Pewarna Rambut',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0), // Beri sedikit jarak antara subjudul dan teks

              // Teks
              Text(
                'Bila kamu mempunyai rambut yang panjang dan tebal, ada baiknya jika kamu menyetok dua kotak cat rambut. Biasanya pada kemasan pewarna rambut akan dicantumkan berapa panjang rambut yang dapat diwarnai dengan 1 kotak produk pewarna. Gunakan ini sebagai patokan',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0), // Tambahkan jarak antara teks sebelumnya dan setelahnya

              Text(
                '5. Aplikasikan Produk Pewarna dari Akar Rambut',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0), // Beri sedikit jarak antara subjudul dan teks

              // Teks
              Text(
                'Akar rambut memerlukan waktu yang lama untuk berubah warna. Setelah mengaplikasikan ke akar, barulah lanjut mengaplikasikannya ke batang sampai ujung rambut. Jangan lupa juga untuk berhati-hati bila mengaplikasikan cat rambut ke akar karena bisa saja kulit kepala terbakar atau alergi.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                '6. Tunggu 20 sampai 30 Menit',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0), // Beri sedikit jarak antara subjudul dan teks

              // Teks
              Text(
                'Setelah kamu selesai mewarnai seluruh bagian rambut, tutup kepala dengan shower cap. Hal ini akan membuat proses oksidasi selama proses pewarnaan menjadi lebih maksimal. Kemudian tunggu sampai 30 menit dan jangan lebih karena hal tersebut akan membuat rambut menjadi lebih rapuh dan cepat rusak bila terlalu lama.',
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