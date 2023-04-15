import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../HomePage/views/bookmarkpage_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        title:  Text('Profile',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("User",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),),
                        Text("User@gmail.com")
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Text('Your Activities',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),

              GestureDetector(
                onTap: (){
                  Get.to(BookmarkpageView());
                },

                child: Container(
                  padding: EdgeInsets.only(left: 15,top: 5,right: 5,bottom: 5),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.bookmark),
                      SizedBox(width: 20,),
                      Text("Bookmark List")
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Text('Theme',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),

              Container(
                padding: EdgeInsets.only(left: 15,top: 5,right: 5,bottom: 5),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.moon_fill),
                    SizedBox(width: 20,),
                    Text("Switch to Dark theme")
                  ],
                ),
              )
              ,
              SizedBox(height: 30,),
              Text('Others',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),

              Container(
                padding: EdgeInsets.only(left: 15,top: 5,right: 5,bottom: 5),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.checkmark_shield_fill),
                    SizedBox(width: 20,),
                    Text("Priyacy Policy & Terms")
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 15,top: 5,right: 5,bottom: 5),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.info_circle_fill),
                    SizedBox(width: 20,),
                    Text("Credits")
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 15,top: 5,right: 5,bottom: 5),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.info_circle_fill),
                    SizedBox(width: 20,),
                    Text("About")
                  ],
                ),
              ),
              SizedBox(height: 20,),

              SizedBox(
                height: 50,width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style:  ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: (){
                      Get.toNamed(Routes.LOGIN);
                    }, child: Text("Sign Out")),
              ),
            ],
          ),
        ),
      )
    );
  }
}
