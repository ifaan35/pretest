import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/img/food.png',
                      height: 80,
                      width: 80,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      style: TextStyle(
                          fontSize: 16.0), // Adjust font size as needed
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF5F5F5),
                        hintText: 'Search...',
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        prefixIcon: Icon(Icons.search), // Add the search icon
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none, // Remove the border
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Katalog Resep Makanan',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            width: 80.0, // Adjust the width as needed
                            height: 35.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/icons/all.png'),
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  'Semua',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              border: Border.all(
                                color: Colors.red, // Warna border merah
                              ),
                            ),
                            width: 95.0,
                            height: 35.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/icons/makanan.png'),
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  'Makanan',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              border: Border.all(
                                color: Colors.red, // Warna border merah
                              ),
                            ),
                            width: 80.0,
                            height: 35.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/icons/buah.png'),
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  'Buah',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              border: Border.all(
                                color: Colors.red, // Warna border merah
                              ),
                            ),
                            width: 105.0,
                            height: 35.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/icons/minuman.png'),
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  'Minuman',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.extent(
                maxCrossAxisExtent: 200,
                padding: EdgeInsets.all(8.0),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0, // Adjust the main-axis spacing as needed
                childAspectRatio: 1.0, // Adjust the aspect ratio as needed
                children: [
                  Container(
                    height: 120, // Adjust the height as needed
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align children to the start (left)
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            'assets/img/pie.jpg', // Replace with your image asset path
                            fit: BoxFit.cover,
                            height:
                                85, // Adjust the height of the image as needed
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height: 10, // Add space between image and text
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(5.0), // Add padding to the text
                          child: Text(
                            'Apple Pie', // Replace with the desired text
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(5.0), // Add padding to the text
                          child: Row(
                            children: [
                              Icon(
                                Icons
                                    .timer, // Replace with the desired timer icon
                                color: Colors.black,
                                size: 16,
                              ),
                              SizedBox(
                                width: 5, // Add space between icon and text
                              ),
                              Text(
                                '50 Menit', // Replace with the desired text
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                ' deskripsi ', // Replace with the desired text
                                style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.amber,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120, // Adjust the height as needed
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align children to the start (left)
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            'assets/img/kentang.jpg', // Replace with your image asset path
                            fit: BoxFit.cover,
                            height:
                                85, // Adjust the height of the image as needed
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height: 10, // Add space between image and text
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(5.0), // Add padding to the text
                          child: Text(
                            'Kentang', // Replace with the desired text
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(5.0), // Add padding to the text
                          child: Row(
                            children: [
                              Icon(
                                Icons
                                    .timer, // Replace with the desired timer icon
                                color: Colors.black,
                                size: 16,
                              ),
                              SizedBox(
                                width: 5, // Add space between icon and text
                              ),
                              Text(
                                '10 Menit', // Replace with the desired text
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                ' deskripsi ', // Replace with the desired text
                                style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.amber,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120, // Adjust the height as needed
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align children to the start (left)
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            'assets/img/nugget.jpg', // Replace with your image asset path
                            fit: BoxFit.cover,
                            height:
                                85, // Adjust the height of the image as needed
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height: 10, // Add space between image and text
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(5.0), // Add padding to the text
                          child: Text(
                            'Nugget', // Replace with the desired text
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(5.0), // Add padding to the text
                          child: Row(
                            children: [
                              Icon(
                                Icons
                                    .timer, // Replace with the desired timer icon
                                color: Colors.black,
                                size: 16,
                              ),
                              SizedBox(
                                width: 5, // Add space between icon and text
                              ),
                              Text(
                                '20 Menit', // Replace with the desired text
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                ' deskripsi ', // Replace with the desired text
                                style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.amber,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120, // Adjust the height as needed
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align children to the start (left)
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            'assets/img/salad.jpg', // Replace with your image asset path
                            fit: BoxFit.cover,
                            height:
                                85, // Adjust the height of the image as needed
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height: 10, // Add space between image and text
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(5.0), // Add padding to the text
                          child: Text(
                            'Salad', // Replace with the desired text
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(5.0), // Add padding to the text
                          child: Row(
                            children: [
                              Icon(
                                Icons
                                    .timer, // Replace with the desired timer icon
                                color: Colors.black,
                                size: 16,
                              ),
                              SizedBox(
                                width: 5, // Add space between icon and text
                              ),
                              Text(
                                '10 Menit', // Replace with the desired text
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                ' deskripsi ', // Replace with the desired text
                                style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.amber,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120, // Adjust the height as needed
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align children to the start (left)
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            'assets/img/seblak.jpg', // Replace with your image asset path
                            fit: BoxFit.cover,
                            height:
                                85, // Adjust the height of the image as needed
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height: 10, // Add space between image and text
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(5.0), // Add padding to the text
                          child: Text(
                            'Seblak', // Replace with the desired text
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(5.0), // Add padding to the text
                          child: Row(
                            children: [
                              Icon(
                                Icons
                                    .timer, // Replace with the desired timer icon
                                color: Colors.black,
                                size: 16,
                              ),
                              SizedBox(
                                width: 5, // Add space between icon and text
                              ),
                              Text(
                                '10 Menit', // Replace with the desired text
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                ' deskripsi ', // Replace with the desired text
                                style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.amber,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
