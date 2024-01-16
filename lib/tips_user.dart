import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api_manager.dart';
import 'detail_tips.dart';

class TipsUserPage extends StatefulWidget {
  final ApiManager apiManager;

  TipsUserPage({required this.apiManager});

  @override
  _TipsUserPageState createState() => _TipsUserPageState();
}

class _TipsUserPageState extends State<TipsUserPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final apiManager = Provider.of<ApiManager>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 196, 193),
        title: Text('Lunar Beauty & Health'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the login screen
              Navigator.pushNamed(context, '/login');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16.0),
            Expanded(
              child: FutureBuilder(
                future: apiManager.fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final tipsData = snapshot.data;

                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: tipsData?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3.0,
                          color: Color.fromARGB(255, 231, 196, 193),
                          child: Column(
                            children: [
                              Image.network(
                                "http://192.168.43.146:8000/storage/images/${tipsData?[index]['foto']}" ??
                                    '',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 150.0,
                              ),
                              ListTile(
                                title: Text(
                                  tipsData?[index]['nama'] ?? '',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailTipsPage(
                                        data: tipsData?[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
