import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';

class UpcomingpageView extends GetView {
  HomePageController homePageController =Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Upcoming",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red[400]),),
          SizedBox(height: 20,),
          Container(
            height: 270,
            child: Obx(() {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homePageController.upcoming.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+homePageController.upcoming[index]['poster_path']

                                  )
                              )),

                            ),
                            Container(
                              child: Text(homePageController.upcoming[index]['title']!= null ?homePageController.upcoming[index]['title']:'Loading'),
                            )
                          ],
                        ),
                      ),
                    );

                  },);
              }
            ),
          ),
        ],
      ),
    );
  }
}
