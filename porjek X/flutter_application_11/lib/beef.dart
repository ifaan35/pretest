import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BeefScreen extends StatefulWidget {
  @override
  _BeefScreenState createState() => _BeefScreenState();
}

class _BeefScreenState extends State<BeefScreen> {
  List? meals = []; // Inisialisasi dengan List kosong

  @override 
  void initState() {
    super.initState();
    fetchMeals('Beef'); // Ubah kategori menjadi 'Beef' sesuai dengan contoh
  }

  Future<void> fetchMeals(String category) async {
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category'));

    if (response.statusCode == 200) {
      setState(() {
        meals = jsonDecode(response.body)['meals'];
      });
    } else {
      throw Exception('Failed to load meals');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beef Meals'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: meals!.isEmpty
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    itemCount: meals!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final meal = meals![index];
                      return GestureDetector(
                        onTap: () {
                          // Handle meal item tap
                        },
                        child: Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      meal['strMealThumb'],
                                      fit: BoxFit.cover,
                                      height: 50,
                                      width: 500,
                                    ),
                                  ),
                                ),
                                Text(
                                  meal['strMeal'] ?? '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
