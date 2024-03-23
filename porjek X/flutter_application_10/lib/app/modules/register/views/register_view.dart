import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_10/app/data/colors.dart';
import 'package:flutter_application_10/app/data/custombtn.dart';
import 'package:flutter_application_10/app/modules/login/views/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.color),
        centerTitle: true,
        title: const Text(
          "Create Account",
          style: TextStyle(
            color: AppColors.color,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * .05),
              Container(
                width: width * .9,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(69, 158, 158, 158),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TextField(
                    style: TextStyle(color: AppColors.color, fontSize: 18),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Name",
                      hintStyle:
                          TextStyle(color: AppColors.color, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * .02),
              Container(
                width: width * .9,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(69, 158, 158, 158),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TextField(
                    style: TextStyle(color: AppColors.color, fontSize: 18),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Email",
                      hintStyle:
                          TextStyle(color: AppColors.color, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * .02),
              Container(
                width: width * .9,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(69, 158, 158, 158),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TextField(
                    obscureText: isObsecure,
                    style:
                        const TextStyle(color: AppColors.color, fontSize: 18),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Password",
                      hintStyle:
                          const TextStyle(color: AppColors.color, fontSize: 18),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                        icon: Icon(
                          isObsecure ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.color,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * .02),
              CustomBtn(
                width: width * .9,
                text: "Create Account",
                btnColor: AppColors.primaryColor,
                btnTextColor: Colors.black,
                onPressed: () {
                  Get.to(() => LoginView());
                },
              ),
              SizedBox(height: height * .02),
              CustomBtn(
                width: width * .9,
                text: "Sudah Punya Akun?",
                btnColor: AppColors.color,
                btnTextColor: Colors.black,
                onPressed: () {
                  Get.to(() => LoginView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
