import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api_manager.dart';
import 'detail_tips.dart';

class DashboardPage extends StatefulWidget {
  final ApiManager apiManager;

  DashboardPage({required this.apiManager});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final apiManager = Provider.of<ApiManager>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 235, 215, 198),
        title: Text('Lunar Beauty'),
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
                    return CircularProgressIndicator();
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
                          color: Colors.blueGrey[100],
                          child: ListTile(
                            leading: Image.network(
                              "http://192.168.43.146:8000/storage/images/${tipsData?[index]['foto']}" ??
                                  '',
                              fit: BoxFit.cover,
                              width: 80.0,
                              height: 80.0,
                            ),
                            title: Text(tipsData?[index]['nama'] ?? ''),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                bool deleteConfirmed = await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Konfirmasi Penghapusan'),
                                    content: Text(
                                        'Apakah Anda yakin ingin menghapus tip ini?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: Text('Batal'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: Text('Hapus'),
                                      ),
                                    ],
                                  ),
                                );

                                if (deleteConfirmed ?? false) {
                                  try {
                                    await apiManager
                                        .deleteTip(tipsData?[index]['id']);
                                    setState(() {});
                                  } catch (e) {
                                    print('Error deleting tip: $e');
                                  }
                                }
                              },
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (index) {
              case 0:
                Navigator.pushReplacementNamed(context, '/home');
                break;
              case 1:
                Navigator.pushReplacementNamed(context, '/tambah_data');
                break;
              case 2:
                Navigator.pushReplacementNamed(context, '/user');
                break;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Tambah Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
