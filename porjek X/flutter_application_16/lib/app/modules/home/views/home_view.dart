import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random User API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomUserPage(),
    );
  }
}

class RandomUserPage extends StatefulWidget {
  @override
  _RandomUserPageState createState() => _RandomUserPageState();
}

class _RandomUserPageState extends State<RandomUserPage> {
  late Future<UserData> futureUserData;

  @override
  void initState() {
    super.initState();
    futureUserData = fetchUserData();
  }

  Future<UserData> fetchUserData() async {
    final response = await http.get(Uri.https('randomuser.me', '/api/'));

    if (response.statusCode == 200) {
      // Jika request berhasil
      return UserData.fromJson(jsonDecode(response.body));
    } else {
      // Jika request gagal, lemparkan error
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random User Data'),
      ),
      body: Center(
        child: FutureBuilder<UserData>(
          future: futureUserData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(snapshot.data!.picture),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${snapshot.data!.firstName} ${snapshot.data!.lastName}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Gender: ${snapshot.data!.gender}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'City: ${snapshot.data!.city}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
