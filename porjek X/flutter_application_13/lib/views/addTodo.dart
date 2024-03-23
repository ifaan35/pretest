import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../models/todo.dart';

class AddTodo extends StatelessWidget {
  final TextEditingController judulController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final Function insertFunction;

  AddTodo({required this.insertFunction, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            iconSize: 20.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            "TODO Aplikasi",
            style: TextStyle(color: Colors.white), // Warna teks putih
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: judulController,
                style: TextStyle(color: Colors.white), // Warna putih pada teks
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukan Judul',
                  labelStyle:
                      TextStyle(color: Colors.white), // Warna putih pada label
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: deskripsiController,
                style: TextStyle(color: Colors.white), // Warna putih pada teks
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukan Deskripsi',
                  labelStyle:
                      TextStyle(color: Colors.white), // Warna putih pada label
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  var todo = Todo(
                    judul: judulController.text,
                    deskripsi: deskripsiController.text,
                    isDone: false,
                  );
                  insertFunction(todo);
                  Navigator.pop(context);
                },
                child: Text("Tambah"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
