import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  late Future<User> _futureUser;

  Future<User> fetchUser() async {
    final response = await http.get(Uri.https('randomuser.me', '/api/'));

    if (response.statusCode == 200) {
      // Jika koneksi berhasil
      return User.fromJson(jsonDecode(response.body));
    } else {
      // Jika koneksi gagal
      throw Exception('Failed to load user');
    }
  }

  @override
  void initState() {
    super.initState();
    _futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random User Details'),
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: _futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return UserCard(user: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // Default case: while waiting for data
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class User {
  final String firstName;
  final String lastName;
  final String city;
  final String gender;
  final String picture;

  User({
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.gender,
    required this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final user = json['results'][0];
    return User(
      firstName: user['name']['first'],
      lastName: user['name']['last'],
      city: user['location']['city'],
      gender: user['gender'],
      picture: user['picture']['large'],
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(user.picture),
          ListTile(
            title: Text('${user.firstName} ${user.lastName}'),
            subtitle: Text('City: ${user.city}\nGender: ${user.gender}'),
          ),
        ],
      ),
    );
  }
}
