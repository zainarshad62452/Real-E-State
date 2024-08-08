import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:realstate/view/buyer/chat/recent_chat_list_screen.dart';
import 'package:realstate/view/buyer/chats/chats_screen.dart';
import 'package:realstate/view/buyer/favorites/favorite_screen.dart';
import 'package:realstate/view/buyer/home_screen/tab_container.dart';
import 'package:realstate/view/buyer/schedule_screen/schedule_screen.dart';
import 'package:realstate/view/buyer/user_profile/user_profile.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}

class DashboardScreen extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreenPage(),
    FavoriteScren(),
    ScheduleScreen(),
    RecentChatsListScreen(),
    UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: _widgetOptions.elementAt(controller.selectedIndex.value),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 36,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() => SizedBox(
                          height: 24,
                          width: double.maxFinite,
                          child: controller.selectedIndex.value == 0
                              ? SvgPicture.asset(
                                  "assets/images/img_nav_home.svg",
                                )
                              : SvgPicture.asset(
                                  "assets/images/home.svg",
                                ),
                        )),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: controller.selectedIndex.value == 0
                            ? Theme.of(context).primaryColor
                            : Colors.black54,
                        fontSize: 8,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 22,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() => SizedBox(
                          height: 24,
                          width: double.maxFinite,
                          child: controller.selectedIndex.value != 1
                              ? SvgPicture.asset(
                                  "assets/images/img_nav_favorite.svg",
                                )
                              : SvgPicture.asset(
                                  "assets/images/heart.svg",
                                ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Favorite",
                        style: TextStyle(
                          color: controller.selectedIndex.value == 0
                              ? Theme.of(context).primaryColor
                              : Colors.black54,
                          fontSize: 8,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 46,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() => SizedBox(
                          height: 24,
                          width: double.maxFinite,
                          child: controller.selectedIndex.value != 2
                              ? SvgPicture.asset(
                                  "assets/images/img_nav_appoint.svg",
                                )
                              : SvgPicture.asset(
                                  "assets/images/appointments.svg",
                                ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Appointments",
                        style: TextStyle(
                          color: controller.selectedIndex.value == 0
                              ? Theme.of(context).primaryColor
                              : Colors.black54,
                          fontSize: 8,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                // width: 32,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() => SizedBox(
                          height: 24,
                          width: double.maxFinite,
                          child: controller.selectedIndex.value != 3
                              ? SvgPicture.asset(
                                  "assets/images/img_nav_inbox.svg",
                                )
                              : SvgPicture.asset(
                                  "assets/images/sms.svg",
                                ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Inbox",
                        style: TextStyle(
                          color: controller.selectedIndex.value == 0
                              ? Theme.of(context).primaryColor
                              : Colors.black54,
                          fontSize: 8,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => SizedBox(
                        height: 24,
                        width: double.maxFinite,
                        child: controller.selectedIndex.value != 4
                            ? SvgPicture.asset(
                                "assets/images/img_nav_profile.svg",
                              )
                            : SvgPicture.asset(
                                "assets/images/profile.svg",
                              ),
                      )),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          color: controller.selectedIndex.value == 0
                              ? Theme.of(context).primaryColor
                              : Colors.black54,
                          fontSize: 8,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              label: '',
            )
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: controller.onItemTapped,
        ),
      ),
    );
  }
}
