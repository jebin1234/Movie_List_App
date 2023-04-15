import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DetailspageView extends GetView {
  final _auth = FirebaseAuth.instance;
  final String name,
      description,
      bannerurl,
      posterurl,
      vote,
      release_on,
      votecount;

  DetailspageView(this.name, this.description, this.bannerurl, this.posterurl,
      this.vote, this.release_on, this.votecount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 350,
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerurl,
                    fit: BoxFit.cover,
                  ),
                )),
                Positioned(
                    bottom: 10,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          release_on,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '⭐  ${vote}   (${votecount})',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )
                      ],
                    )),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'Story',
                  style: TextStyle(
                      color: Colors.red[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  description,
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cast',
                  style: TextStyle(
                      color: Colors.red[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 40,
            child: Icon(Icons.person),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Related video',
                  style: TextStyle(
                      color: Colors.red[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Similar',
                  style: TextStyle(
                      color: Colors.red[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Createdata();
                  showToast(context);
                },
                child: Text("Add to Bookmarks")),
          ),
        ],
      ),
    ));
  }

  Createdata() {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Bookmark").doc(name);
    Map<String, String> reg = {
      "title": name,
      "Image": bannerurl,
      "userId": _auth.currentUser!.uid,
    };

    documentReference.set(reg).whenComplete(() => print("data sucess"));
    print("Upload data");
  }

  showToast(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green,
      ),
      child: Text(
        'Sucessfully Bookmarked',
        style: TextStyle(color: Colors.white),
      ),
    );
    fToast.showToast(
      child: toast,
      toastDuration: Duration(seconds: 2),
      gravity: ToastGravity.TOP,
    );
  }
}
