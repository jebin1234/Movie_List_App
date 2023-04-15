import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:leave_management/app/modules/HomePage/views/upcomingpage_view.dart';

import '../controllers/home_page_controller.dart';
import 'detailspage_view.dart';
import 'nowplayingpage_view.dart';

class HomePageView extends GetView<HomePageController> {
  //HomePageController homePageController =Get.find<HomePageController>();
  HomePageController homePageController = Get.isRegistered<HomePageController>()
      ? Get.find<HomePageController>()
      : Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 8.0,bottom: 8.0),
          child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homePageController.tendingmovie.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            Get.to(DetailspageView(homePageController.tendingmovie[index]['title'],
                                homePageController.tendingmovie[index]['overview'],
                                'https://image.tmdb.org/t/p/w500'+
                                homePageController.tendingmovie[index]['backdrop_path'],
                                'https://image.tmdb.org/t/p/w500'+
                                homePageController.tendingmovie[index]['poster_path'],
                                homePageController.tendingmovie[index]['vote_average'].toString(),
                                homePageController.tendingmovie[index]['release_date'],
                                homePageController.tendingmovie[index]['vote_count'].toString()));
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 300,
                                      child: Image.network('https://image.tmdb.org/t/p/w500'+homePageController.tendingmovie[index]['backdrop_path'],
                                        fit: BoxFit.cover
                                        ,),
                                      foregroundDecoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Colors.white, Colors.transparent, Colors.transparent, Colors.white],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          stops: [0, 0,0 , 1],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              Positioned(bottom:30,left:20,
                                  child: Container(
                                child: Text(homePageController.tendingmovie[index]['title']!= null ?homePageController.tendingmovie[index]['title']:'Loading',style:
                                  TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                              ))
                            ],
                          ),
                        );

                    },),
                  ),

                 NowplayingpageView(),
                  UpcomingpageView()
                ],
              );
            }
          ),
        ),
      )
    );
  }

}
