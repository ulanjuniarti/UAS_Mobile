// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Add Tips',
//       home: AddTipsPage(),
//     );
//   }
// }

// class AddTipsPage extends StatefulWidget {
//   @override
//   _AddTipsPageState createState() => _AddTipsPageState();
// }

// class _AddTipsPageState extends State<AddTipsPage> {
//   TextEditingController _titleController = TextEditingController();
//   TextEditingController _tipsController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Tips'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             _buildImagePicker(),
//             SizedBox(height: 16.0),
//             _buildTitleTextField(),
//             SizedBox(height: 16.0),
//             _buildTipsTextField(),
//             SizedBox(height: 16.0),
//             _buildSubmitButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildImagePicker() {
//     // Implement image picker widget here
//     return Container(
//       // Your image picker widget code goes here
//       child: Text('Image Picker'),
//     );
//   }

//   Widget _buildTitleTextField() {
//     return TextFormField(
//       controller: _titleController,
//       decoration: InputDecoration(
//         labelText: 'Judul',
//         border: OutlineInputBorder(),
//       ),
//     );
//   }

//   Widget _buildTipsTextField() {
//     return TextFormField(
//       controller: _tipsController,
//       maxLines: 5,
//       decoration: InputDecoration(
//         labelText: 'Tips',
//         border: OutlineInputBorder(),
//       ),
//     );
//   }

//   Widget _buildSubmitButton() {
//     return ElevatedButton(
//       onPressed: () {
//         // Handle submit button press
//         _submitTips();
//       },
//       child: Text('Tambah Tips'),
//     );
//   }

//   void _submitTips() {
//     // Implement logic to save tips data
//     String title = _titleController.text;
//     String tips = _tipsController.text;

//     // Add your logic to save the data (e.g., to a database or API)

//     // Optionally, you can show a confirmation message or navigate to another screen
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Tips berhasil ditambahkan!'),
//       ),
//     );
//   }
// }
