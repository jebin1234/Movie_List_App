import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BookmarkpageView extends GetView {
  final currentUser =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Text("Bookmark List",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red[400]),),
            SizedBox(height: 20,),

            Container(
              height: 300,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("Bookmark")
                      .where("userId",isEqualTo: currentUser.currentUser!.uid)
                      .snapshots(),
                  builder: (context,snapshot)
                  {
                    if(snapshot.hasError){
                      return Text("Some error");
                    }else if(snapshot.hasData ||snapshot.data !=null) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            QueryDocumentSnapshot<Object?>?  documentsnapshot=
                            snapshot.data?.docs[index];
                            return Container(
                              padding: EdgeInsets.all(5),
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(image: DecorationImage(
                                        image: NetworkImage(documentsnapshot!['Image'],

                                        ),fit: BoxFit.cover
                                    ),borderRadius: BorderRadius.circular(15)
                                    ),

                                  ),
                                  SizedBox(height: 5,),
                                  Container(
                                    child: Text(documentsnapshot!['title'],
                                      style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black45),),
                                  )
                                ],
                              ),
                            );
                          }
                      );
                    }
                    return Center(
                      child:CircularProgressIndicator() ,
                    );
                  }
              ),
            )


          ],
        ),
      )
    );
  }
}
