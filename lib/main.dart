import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'splash_screen.dart';
import 'login.dart';
import 'register.dart';
import 'home.dart';
import 'api_manager.dart';
import 'user_manager.dart';
import 'tambah_data.dart';
import 'dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String baseUrl = 'http://192.168.43.146:8000/api';
  final ApiManager apiManager = ApiManager(baseUrl: 'http://192.168.43.146:8000/api');


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserManager()),
        Provider.value(value: apiManager),
      ],
      child: MaterialApp(
        title: 'Lunar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginPage(apiManager: ApiManager(baseUrl: baseUrl)),
          '/register': (context) => RegisterPage(apiManager: ApiManager(baseUrl: baseUrl)),
          '/home': (context) => HomePage(),
          '/tambah_data': (context) => TambahDataPage(apiManager: ApiManager(baseUrl: baseUrl)),
          '/dashboard': (context) => DashboardPage(apiManager: ApiManager(baseUrl: baseUrl)),
          '/user': (context) => UserPage(),
        },
      ),
    );
  }
}
