import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Import the BeefScreen
import 'beef.dart';

void main() {
  runApp(ListMeal());
}

class ListMeal extends StatefulWidget {
  @override
  _ListMealState createState() => _ListMealState();
}

class _ListMealState extends State<ListMeal> {
  late List? meals;

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  Future<void> fetchMeals() async {
    final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

    if (response.statusCode == 200) {
      setState(() {
        meals = jsonDecode(response.body)['categories'];
      });
    } else {
      throw Exception('Failed to load meals');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Categories',
      initialRoute: '/', // Set initial route
      routes: {
        '/': (context) => Scaffold(
              // Define the initial route
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 15.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 2,
                    margin: EdgeInsets.all(12.0),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF5F5F5),
                        hintText: 'Search...',
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'List Meal Categories',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: meals == null
                        ? Center(child: CircularProgressIndicator())
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: meals!.length,
                            itemBuilder: (BuildContext context, int index) {
                              final meal = meals![index];
                              return GestureDetector(
                                onTap: () {
                                  // Navigate to BeefScreen when beef category is tapped
                                  Navigator.of(context).pushNamed('/beef');
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: meal['strCategoryThumb'] !=
                                                    null
                                                ? Image.network(
                                                    meal['strCategoryThumb'],
                                                    fit: BoxFit.cover,
                                                    width:
                                                        150, // Set the width to 100
                                                  )
                                                : Container(),
                                          ),
                                        ),
                                        SizedBox(height: 5.0),
                                        Text(
                                          meal['strCategory'] ?? '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(height: 5.0),
                                        // Show strInstructions below strCategory if it's not null
                                        Expanded(
                                          child: Text(
                                            meal['strCategoryDescription'] ??
                                                '',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            textAlign: TextAlign.start,
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
            ),
        '/beef': (context) => BeefScreen(), // Define the route for BeefScreen
      },
    );
  }
}
