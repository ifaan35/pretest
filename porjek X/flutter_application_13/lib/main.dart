import 'package:flutter/material.dart';
import '../colors.dart';
import '../models/todo.dart';
import '../views/addTodo.dart';
import '../views/todoList.dart';
import '../utils/DbHelper.dart';
import '../widgets/search_box.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: const AppBarTheme(color: AppColors.backgroundColor),
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final db = DbHelper(); // Creating an instance of DbHelper here

  void add(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void delete(int id) async {
    await db.deleteTodo(id);
    setState(() {});
  }

  void isChecked(int id, bool value) async {
    await db.isCheckedTodo(id, value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/img/todologo.png', // Path to your logo image
              height: 32, // Adjust the height as needed
            ),
            SizedBox(width: 8), // Add some spacing between image and text
            Text(
              "TODO Aplikasi",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          TodoList(
            deleteFunction: delete,
            isChecked: isChecked,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTodo(insertFunction: add),
                ),
              );
            },
            child: Text("Tambah"),
          ),
        ),
      ),
    );
  }
}
