import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../routes/app_pages.dart';
import '../../Common/views/common_view.dart';
import '../../Home/views/home_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Colors.deepPurple.shade400,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Sign In",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            SizedBox(
              height: 30,
            ),
            Text("Enter your user information below or continue with ",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            Text(" one of your social accounts",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                prefixIconColor: Colors.grey,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Email',
                enabled: true,
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey),
                  borderRadius: new BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey),
                  borderRadius: new BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(CupertinoIcons.eye_slash_fill),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Password',
                enabled: true,
                contentPadding:
                    EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey),
                  borderRadius: new BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text("Forgot password ?",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey))),
            SizedBox(
              height: 20,
            ),
            commonbutton(
              title: 'Sign In',
              onClick: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: emailcontroller.text,
                        password: passwordController.text)
                    .then((value) {
                  print("Sucess");
                  Get.to(HomeView());
                }).onError((error, stackTrace) {
                  print("Error");
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text('Does not have an account ?'),
                TextButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16, color: Colors.red[400]),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.REGISTRATION);
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
