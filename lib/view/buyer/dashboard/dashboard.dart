import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:realstate/core/utils/responsive.dart';

import 'package:realstate/view/buyer/buying_list/buying_list_screen.dart';
import 'package:realstate/view/buyer/buying_property/buying_property_screen.dart';
import 'package:realstate/view/buyer/chat/recent_chat_list_screen.dart';
import 'package:realstate/view/buyer/favorites/favorite_screen.dart';
import 'package:realstate/view/buyer/home_screen/tab_container.dart';
import 'package:realstate/view/buyer/home_screen/tab_container_controller.dart';
import 'package:realstate/view/buyer/rent_property_detail/rent_property_details_screen.dart';
import 'package:realstate/view/buyer/schedule_screen/all_appointments_screen.dart';
import 'package:realstate/view/buyer/schedule_screen/schedule_screen.dart';
import 'package:realstate/view/buyer/user_profile/user_profile.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;
  var isDrawerCollapsed = false.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  void toggleDrawer() {
    isDrawerCollapsed.value = !isDrawerCollapsed.value;
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
  var hom = Get.put(HomeScreenPageController());

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreenPage(),
    BuyPropertyScreen(),
    RentPropertyScreen(),
    AllAppointmentsScreen(),
    RecentChatsListScreen(),
    UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildMobileLayout(context),
      tablet: _buildMobileLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
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
              icon: _buildNavBarIcon(context, "Home", 0, "home.svg"),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavBarIcon(context, "Favorite", 1, "heart.svg"),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavBarIcon(context, "Appointments", 2, "appoint.svg"),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavBarIcon(context, "Inbox", 3, "inbox.svg"),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavBarIcon(context, "Profile", 4, "profile.svg"),
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

  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Obx(
            () => controller.isDrawerCollapsed.value
                ? _buildCollapsedDrawerButton(context)
                : AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: 200,
                    child: _buildDrawer(context),
                  ),
          ),
          Expanded(
            child: Obx(
              () => _widgetOptions.elementAt(controller.selectedIndex.value),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Collapse/Expand Button
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: controller.toggleDrawer,
            ),
          ),
          // Drawer Items
          _buildDrawerItem(context, "Home", 0, "home.svg"),
          _buildDrawerItem(context, "Favorite", 1, "heart.svg"),
          _buildDrawerItem(context, "Appointments", 2, "appoint.svg"),
          _buildDrawerItem(context, "Inbox", 3, "inbox.svg"),
          _buildDrawerItem(context, "Profile", 4, "profile.svg"),
        ],
      ),
    );
  }

  Widget _buildCollapsedDrawerButton(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(Icons.menu),
        onPressed: controller.toggleDrawer,
      ),
    );
  }

  Widget _buildNavBarIcon(
      BuildContext context, String label, int index, String assetName) {
    return SizedBox(
      width: 36,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => SizedBox(
              height: 24,
              width: double.maxFinite,
              child: SvgPicture.asset(
                controller.selectedIndex.value != index
                    ? "assets/images/img_nav_$assetName"
                    : "assets/images/$assetName",
              ),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: controller.selectedIndex.value == index
                  ? Theme.of(context).primaryColor
                  : Colors.black54,
              fontSize: 8,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, String label, int index, String assetName) {
    return ListTile(
      leading: SvgPicture.asset(
        controller.selectedIndex.value != index
            ? "assets/images/img_nav_$assetName"
            : "assets/images/$assetName",
      ),
      title: Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
      onTap: () {
        controller.onItemTapped(index);
        if (Responsive.isMobile(context)) {
          Navigator.pop(context); // Close the drawer on mobile
        }
      },
    );
  }
}
