import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiManager {
  final String baseUrl;
  final storage = FlutterSecureStorage();

  ApiManager({required this.baseUrl});

  Future<String?> addTip(String nama, String deskripsi, File foto) async {
  try {
    final token = await getToken();

    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/store-foto'));
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['nama'] = nama;
    request.fields['deskripsi'] = deskripsi;
    request.files.add(await http.MultipartFile.fromPath('foto', foto.path));

    var response = await request.send();

    if (response.statusCode == 201) {
      final jsonResponse = jsonDecode(await response.stream.bytesToString());
      final addedTipId = jsonResponse['id'].toString();
      return addedTipId;
    } else {
      throw Exception('Failed Status Code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error in addTip: $e');
    throw e;
  }
}


  Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final token = await getToken();
      final response = await http.get(
        Uri.parse('$baseUrl/tips'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(jsonResponse);
      } else {
        throw Exception(
            'Failed to fetch data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetchData: $e');
      throw e;
    }
  }

  Future<void> updateTip(
    String id,
    String nama,
    String deskripsi,
    String foto,
  ) async {
    try {
      final token = await getToken();
      final response = await http.put(
        Uri.parse('$baseUrl/tips/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'nama': nama,
          'deskripsi': deskripsi,
          'foto': foto,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to update tip. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in updateTip: $e');
      throw e;
    }
  }

  Future<void> deleteTip(int id) async {
  try {
    final token = await getToken();
    final response = await http.delete(
      Uri.parse('$baseUrl/tips/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    print('Respon Delete: ${response.statusCode} - ${response.body}');

    if (response.statusCode != 200) {
      throw Exception(
          'Gagal menghapus tip. Kode Status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error dalam deleteTip: $e');
    throw e;
  }
}

  Future<String> getToken() async {
    final token = await storage.read(key: 'kode_rahassia');
    if (token == null) {
      throw Exception('Token is null');
    }
    return token;
  }

  Future<String?> register(String name, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {'name': name, 'email': email, 'password': password},
      );

      if (response.statusCode == 201) {
        final token = "Successfully";
        return token;
      } else {
        throw Exception(
            'Failed to register, email already exists. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in register: $e');
      throw e;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login.php'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {'email': email, 'password': password},
      );

      final jsonResponse = jsonDecode(response.body);
      final token = jsonResponse['token'];

      await storage.write(key: 'auth_token', value: token);
    } catch (e) {
      print('Error in login: $e');
      throw e;
    }
  }

  Future<String?> authenticate(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final token = jsonResponse['token'];

        await storage.write(key: 'kode_rahassia', value: token);

        return token;
      } else {
        throw Exception(
            'Failed to authenticate. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in authenticate: $e');
      throw e;
    }
  }
}
