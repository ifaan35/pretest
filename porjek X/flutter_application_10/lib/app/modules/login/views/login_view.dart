import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_10/app/modules/home/views/home_view.dart';
import 'package:flutter_application_10/app/data/colors.dart';
import 'package:flutter_application_10/app/data/custombtn.dart';
import 'package:flutter_application_10/app/modules/register/views/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isObsecure = true;
  bool? checked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Check if email and password match
    if (email == "ifan@gmail.com" && password == "ifan123") {
      // Jika benar, pindah ke HomeView
      Get.to(() => HomeView());
    } else {
      // Jika salah, tampilkan pesan kesalahan
      Get.snackbar(
        "Error",
        "Invalid email or password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    color: AppColors.color,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: height * .05),
                Container(
                  width: width * .9,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(69, 158, 158, 158),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextField(
                      controller: emailController,
                      style: TextStyle(color: AppColors.color, fontSize: 18),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Email or username",
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
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextField(
                      controller: passwordController,
                      obscureText: isObsecure,
                      style: TextStyle(color: AppColors.color, fontSize: 18),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Password",
                        hintStyle:
                            TextStyle(color: AppColors.color, fontSize: 18),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          },
                          icon: Icon(
                            isObsecure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.color,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * .01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: checked,
                            onChanged: (value) {
                              setState(() {
                                checked = value;
                              });
                            },
                          ),
                          const Text(
                            "Remember me",
                            style:
                                TextStyle(color: AppColors.color, fontSize: 16),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgotten password?",
                          style:
                              TextStyle(color: AppColors.color, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * .01),
                CustomBtn(
                  width: width * .9,
                  text: "Login",
                  btnColor: AppColors.primaryColor,
                  btnTextColor: Colors.black,
                  onPressed: login, // Panggil fungsi login saat tombol ditekan
                ),
                SizedBox(height: height * .02),
                GestureDetector(
                  onTap: () => Get.to(() => const RegisterView()),
                  child: CustomBtn(
                    width: width * .9,
                    text: "Register",
                    btnColor: AppColors.color,
                    btnTextColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
