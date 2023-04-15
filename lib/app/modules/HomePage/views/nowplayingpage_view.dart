import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../controllers/home_page_controller.dart';

class NowplayingpageView extends GetView {
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Now Playing ",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red[400]),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homePageController.nowplaying.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              homePageController
                                                      .nowplaying[index]
                                                  ['poster_path'])),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 20,
                              child: Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black,
                                ),
                                child: CircularPercentIndicator(
                                  radius: 15.0,
                                  lineWidth: 5.0,
                                  animation: false,
                                  percent: 0.7,
                                  center: Text(
                                    homePageController.nowplaying[index]
                                            ['vote_count']
                                        .toString(),
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.0,
                                        color: Colors.white),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.green,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            homePageController.nowplaying[index]
                                        ['release_date'] !=
                                    null
                                ? homePageController.nowplaying[index]
                                    ['release_date']
                                : 'Loading',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black45),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
