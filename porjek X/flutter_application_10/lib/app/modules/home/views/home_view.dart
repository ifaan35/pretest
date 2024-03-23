import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_application_10/app/data/colors.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.color),
        centerTitle: true,
        title: const Text(
          'HomeView',
          style: TextStyle(
            color: AppColors.color,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/img/ifan.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ikfan Yudha',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Saya adalah seorang mahasiswa universitas mulia, jurusan informatika. Minat saya dalam dunia pemrograman web telah tumbuh sejak masa sekolah menengah kejuruan, di mana saya mendalami rekayasa perangkat lunak.\n\n'
                'Jenis Kelamin : Laki-Laki\nTempat lahir : Tanah Grogot\nTanggal lahir : 08 September 2002\nFakultas : Ilmu Komputer\nProdi : S1 Informatika\n',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
