import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/common_controller.dart';

class commonbutton extends GetView<CommonController> {
  void Function() onClick;
  String title;

  commonbutton({required this.title,required this.onClick});

  Widget build(BuildContext context) {
    return Container(
     // padding: EdgeInsets.only(left: 5,right: 5),
      height: 50,width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style:  ElevatedButton.styleFrom(
            backgroundColor: Colors.red[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),

            ),
          ),

          onPressed: (){
            onClick();


          }, child: Text(title)),
    );
  }
}
