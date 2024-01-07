import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'api_manager.dart';

class UpdateDataPage extends StatefulWidget {
  final ApiManager apiManager;
  final Map<String, dynamic>? existingData;

  UpdateDataPage({required this.apiManager, required this.existingData});

  @override
  _UpdateDataPageState createState() => _UpdateDataPageState();
}

class _UpdateDataPageState extends State<UpdateDataPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  File? _selectedFile;

  @override
  void initState() {
    super.initState();
    // Populate the text controllers with existing data
    _namaController.text = widget.existingData?['nama'] ?? '';
    _deskripsiController.text = widget.existingData?['deskripsi'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _deskripsiController,
              decoration: InputDecoration(labelText: 'Deskripsi'),
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
                            : Image.network(
                                "http://192.168.43.146:8000/storage/images/${widget.existingData?['foto']}" ??
                                    '',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
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
                    // Update the existing data with a new photo
                    await widget.apiManager.UpdateWithFoto(
                      nama,
                      deskripsi,
                      widget.existingData!['id'].toString(),
                      _selectedFile!,
                    );
                  } else {
                    // Update the existing data without changing the photo
                    await widget.apiManager.UpdateWithoutFoto(
                      widget.existingData!['id'].toString(),
                      nama,
                      deskripsi,
                    );
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Data berhasil diperbarui'),
                    ),
                  );

                  // Navigate back to the dashboard after updating data
                  Navigator.pushReplacementNamed(context, '/dashboard');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Gagal memperbarui data: $e'),
                    ),
                  );
                }
              },
              child: Text('Perbarui Data'),
            ),
          ],
        ),
      ),
    );
  }
}
