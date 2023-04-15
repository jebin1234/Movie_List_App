import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Activity/views/activity_view.dart';
import '../../HomePage/views/home_page_view.dart';
import '../../Profile/views/profile_view.dart';
import '../../Search/views/search_view.dart';
import '../controllers/home_controller.dart';
class HomeView extends GetView<HomeController> {
  HomeController mainActivityController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        return IndexedStack(
          index: mainActivityController.currentPage.value,
          children: [
            HomePageView(),
            SearchView(),
            ActivityView(),
            ProfileView()
          ],
        );
      }),
      bottomNavigationBar: Obx((){
        return  BottomNavigationBar(
          showSelectedLabels: true,
          unselectedFontSize: 10,
          selectedFontSize: 12,
          selectedItemColor: Colors.red[400],
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex : mainActivityController.currentPage.value,
          onTap: (index){
            mainActivityController.changeTabIndex(index);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house_fill),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_fill),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_fill),
              label: 'Profile',
            ),
          ],
        );
      }),

    );
  }
}
