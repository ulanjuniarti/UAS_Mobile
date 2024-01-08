import 'dart:io';

import 'package:flutter/material.dart';
import 'api_manager.dart';
import 'package:file_picker/file_picker.dart';

class TambahDataPage extends StatefulWidget {
  final ApiManager apiManager;

  TambahDataPage({required this.apiManager});

  @override
  _TambahDataPageState createState() => _TambahDataPageState();
}

class _TambahDataPageState extends State<TambahDataPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  File? _selectedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/dashboard');
          },
        ),
      ),
      body: SingleChildScrollView(
        // Tambahkan widget SingleChildScrollView di sini
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Judul'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _deskripsiController,
                decoration: InputDecoration(labelText: 'Deskripsi'),
                maxLines:
                    null, // Set maxLines ke null agar dapat mengganti baris dengan Enter
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.image,
                          allowMultiple: false,
                        );

                        if (result != null) {
                          setState(() {
                            _selectedFile = File(result.files.single.path!);
                          });
                        }
                      },
                      child: Container(
                        height: 80.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: _selectedFile != null
                              ? Image.file(_selectedFile!, fit: BoxFit.cover)
                              : Text('Pilih Foto'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  final nama = _namaController.text;
                  final deskripsi = _deskripsiController.text;

                  try {
                    if (_selectedFile != null) {
                      await widget.apiManager
                          .addTip(nama, deskripsi, _selectedFile!);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Data berhasil ditambahkan'),
                        ),
                      );

                      // Arahkan ke halaman Dashboard setelah data ditambahkan
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Pilih file foto terlebih dahulu'),
                        ),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Gagal menambahkan data: $e'),
                      ),
                    );
                  }
                },
                child: Text('Tambah Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
