import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/controllers/user_controller.dart';
import 'package:realstate/core/utils/responsive.dart';
import 'package:realstate/view/buyer/chat/chat_screen.dart';
import 'package:realstate/view/buyer/user_profile/user_profile.dart';
import 'package:realstate/view/seller/add_property_screen/add_property_screen.dart';
import 'package:realstate/view/seller/home_screen/home_screen.dart';
import 'dashboard_controller.dart';

class SellerDashboard extends StatelessWidget {
  final SellerDashboardController controller =
      Get.put(SellerDashboardController());

  final List<Widget> pages = [
    ChatPage(userModel: userCntr.user!.value), // Placeholder for Chat Screen
    SellerHomeScreen(),
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
      body: Obx(() => pages[controller.currentPage.value]),
      bottomNavigationBar: CurvedNavigationBar(
        key: controller.bottomNavigationKey,
        index: 0,
        items: <Widget>[
          Icon(Icons.chat, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          controller.changePage(index);
        },
        letIndexChange: (index) => true,
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
                    width: controller.isDrawerCollapsed.value ? 60 : 200,
                    child: _buildDrawer(context),
                  ),
          ),
          Expanded(
            child: Obx(
              () => pages[controller.currentPage.value],
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
          _buildDrawerItem(context, "Chat", 0, Icons.chat),
          _buildDrawerItem(context, "Seller Home", 1, Icons.add),
          _buildDrawerItem(context, "User Profile", 2, Icons.person),
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

  Widget _buildDrawerItem(
      BuildContext context, String label, int index, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label, style: TextStyle(fontSize: 18)),
      onTap: () {
        controller.changePage(index);
        if (Responsive.isMobile(context)) {
          Navigator.pop(context); // Close the drawer on mobile
        }
      },
    );
  }
}
