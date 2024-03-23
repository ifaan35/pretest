import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          background: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'NEW RECIPE'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: <Widget>[
            Text(
              'muk',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Center(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: 10), // Sesuaikan jumlah geseran sesuai kebutuhan
            child: Text(
              'Close',
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.zero, // Set padding to zero
        child: Column(
          children: <Widget>[
            Center(
                child: Container(
              color: Colors.red,
              child: const Text(
                'Super Cool you are craeating a new recipe lets get started',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )),
            const SizedBox(height: 35),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Please give your first recipe a name:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 1),
            TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan nama menu',
              ),
            ),
            const SizedBox(height: 25),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'estimasi waktu memasak (menit)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Masukan waktu pembuatan',
              ),
            ),
            const SizedBox(height: 25),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'deskripsi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 60),
            TextField(
              decoration: InputDecoration(
                hintText: 'masukan deskripsi',
              ),
            ),
            const SizedBox(height: 25),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Resep,bahan dan langkah',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 60),
            TextField(
              decoration: InputDecoration(
                hintText: 'Masukan resep dan cara pembuatan',
              ),
            ),
            const SizedBox(height: 35),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Warna latar belakang tombol
                  minimumSize:
                      Size(double.infinity, 50), // Lebar dan tinggi tombol
                ),
                onPressed: () {
                  print("Button Clicked");
                },
                child: Text(
                  "Add Menu",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
