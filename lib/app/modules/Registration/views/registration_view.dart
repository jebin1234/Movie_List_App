import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../Common/views/common_view.dart';
import '../../Login/views/login_view.dart';
import '../controllers/registration_controller.dart';
final _auth = FirebaseAuth.instance;


class RegistrationView extends GetView<RegistrationController> {
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  TextEditingController namecontroller =TextEditingController();
  TextEditingController conformpasscontroller =TextEditingController();



  Signin(){
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text)
        .then((value) {
      print("Sucess");
      Createdata();
    }).onError((error, stackTrace) {
      print("Error");
    });

  }
  Createdata(){
    // DocumentReference documentReference = FirebaseFirestore.instance.collection("Registration").doc(rolecontroller.text);
    // Map<String,String>register ={
    //   "email":emailcontroller.text,
    //   "role":rolecontroller.text
    // };
    // documentReference.
    // set(register).whenComplete(() => print("Data stored"));

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    Map<String,String>reg={
      "name":namecontroller.text,
      "email":emailcontroller.text,
      "userId":_auth.currentUser!.uid,
      "password":passwordcontroller.text,
      "confirmpass":conformpasscontroller.text,

    };
   // ref.doc(user!.uid).set({
      // "firstname":firstnamecontroller.text,
      // "middlename":middlenamecontroller.text,
      // "lasname":lastnamecontroller.text,
      // "email":emailcontroller.text,
      // "phone":phonenumbercontroller.text,
      // "sickleave":sickleavecontroller.text,
      //  "marraigeleave":marraigecontroller.text,
      //  "casualleave":casualcontroller.text,
      //  "rool":rolecontroller.text
    //});
    ref.doc(user!.uid).set(reg).whenComplete(() => print("data sucess"));
    print("Upload data");
    Get.to(LoginView());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sign Up",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color:Colors.black )),
              SizedBox(height: 30,),
              Text("Enter your user information below or continue with ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.grey )),
              Text(" one of your social accounts",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.grey )),
              SizedBox(height: 50,),
              TextFormField(
                controller:namecontroller ,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Name',
                  hintStyle:  TextStyle(fontWeight: FontWeight.w400,color:Colors.grey ),
                  enabled: true,
                  contentPadding:  EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.grey),
                    borderRadius:  BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                ),

              ),
              SizedBox(height: 20,),
              TextFormField(

                controller: emailcontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email Address',
                  hintStyle:  TextStyle(fontWeight: FontWeight.w400,color:Colors.grey ),
                  enabled: true,
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
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
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                controller: passwordcontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(CupertinoIcons.eye_slash_fill),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Password',
                  hintStyle:  TextStyle(fontWeight: FontWeight.w400,color:Colors.grey ),
                  enabled: true,
                  contentPadding:  EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.grey),
                    borderRadius:  BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                ),

              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: conformpasscontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(CupertinoIcons.eye_slash_fill),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Confirm Password',

                  hintStyle:  TextStyle(fontWeight: FontWeight.w400,color:Colors.grey ),
                  enabled: true,
                  contentPadding:  EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.grey),
                    borderRadius:  BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                ),

              ),
              SizedBox(height: 20,),
              Text("By signing up,you accept Privacy Policy & Terms of Service",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color:Colors.grey )),
              SizedBox(height: 40,),


              commonbutton(title: 'Sign Up', onClick: () {  Signin(); },),
              SizedBox(height: 20,),

              Row(
                children: <Widget>[
                  const Text('Does not have an account ?'),
                  TextButton(
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 16,color: Colors.red[400]),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),


            ],
          ),
        )
    );;
  }
}
