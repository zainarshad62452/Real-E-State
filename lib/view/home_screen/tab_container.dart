import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realstate/core/routes/app_routes.dart';
import 'package:realstate/view/home_screen/home_screen.dart';
import 'package:realstate/view/home_screen/tab_container_controller.dart';

class HomeScreenPage extends GetWidget<HomeScreenPageController> {
  const HomeScreenPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0XFFF2F3F3),
      // appBar: _buildAppBar(),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 44,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leadingWidth: 52,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {},
            constraints: BoxConstraints(
              minHeight: 32,
              minWidth: 32,
            ),
            padding: EdgeInsets.all(0),
            icon: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Color(0XFFF2F3F3),
                borderRadius: BorderRadius.circular(
                  16,
                ),
                border: Border.all(
                  color: Color(0XFFCCCCCC),
                  width: 1,
                ),
              ),
              padding: EdgeInsets.all(4),
              child: SvgPicture.asset(
                "assets/images/img_group_1171285370.svg",
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Pak  Islamabad",
          style: TextStyle(
            color: Color(0XFF000000),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 19),
            child: IconButton(
              onPressed: () {},
              constraints: BoxConstraints(
                minHeight: 32,
                minWidth: 32,
              ),
              padding: EdgeInsets.all(0),
              icon: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Color(0XFFF2F3F3),
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  border: Border.all(
                    color: Color(0XFFCCCCCC),
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.all(6),
                child: SvgPicture.asset(
                  "assets/images/img_group_1171285369.svg",
                ),
              ),
            ),
          )
        ],
        bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
            child: _buildSearchSection()),
      ),
      body: TabBarView(
        controller: controller.tabviewController,
        children: [HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen()],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 44,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leadingWidth: 52,
      leading: Padding(
        padding: EdgeInsets.only(left: 20),
        child: IconButton(
          onPressed: () {},
          constraints: BoxConstraints(
            minHeight: 32,
            minWidth: 32,
          ),
          padding: EdgeInsets.all(0),
          icon: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Color(0XFFF2F3F3),
              borderRadius: BorderRadius.circular(
                16,
              ),
              border: Border.all(
                color: Color(0XFFCCCCCC),
                width: 1,
              ),
            ),
            padding: EdgeInsets.all(4),
            child: SvgPicture.asset(
              "assets/images/img_group_1171285370.svg",
            ),
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        "Pak  Islamabad",
        style: TextStyle(
          color: Color(0XFF000000),
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 19),
          child: IconButton(
            onPressed: () {},
            constraints: BoxConstraints(
              minHeight: 32,
              minWidth: 32,
            ),
            padding: EdgeInsets.all(0),
            icon: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Color(0XFFF2F3F3),
                borderRadius: BorderRadius.circular(
                  16,
                ),
                border: Border.all(
                  color: Color(0XFFCCCCCC),
                  width: 1,
                ),
              ),
              padding: EdgeInsets.all(6),
              child: SvgPicture.asset(
                "assets/images/img_group_1171285369.svg",
              ),
            ),
          ),
        )
      ],
    );
  
  }

  Widget _buildSearchSection() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    child: TextFormField(
                      focusNode: FocusNode(),
                      autofocus: false,
                      controller: controller.searchController,
                      style: TextStyle(
                        color: Color(0XB2000000),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintText: "Search property...",
                        hintStyle: TextStyle(
                          color: Color(0XB2000000),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: Container(
                          margin: EdgeInsets.fromLTRB(16, 12, 12, 12),
                          child: SvgPicture.asset(
                            "assets/images/img_group_39334.svg",
                            height: 24,
                            width: 24,
                          ),
                        ),
                        suffixIcon: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: SvgPicture.asset(
                            "assets/images/img_group_39335.svg",
                            height: 24,
                            width: 24,
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0XFFFFFFFF),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              30.0), // This makes the border round
                          borderSide: BorderSide
                              .none, // This removes the default border
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                SizedBox(width: 12),
                IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.propertAppHomeFilterScreen);
                  },
                  constraints: BoxConstraints(
                    minHeight: 40,
                    minWidth: 40,
                  ),
                  padding: EdgeInsets.all(0),
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      border: Border.all(
                        color: Color(0XFFCCCCCC),
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      "assets/images/img_group_1171285379.svg",
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 40,
            width: double.maxFinite,
            child: TabBar(
              controller: controller.tabviewController,
              labelPadding: EdgeInsets.zero,
              labelColor: Color(0XFFFFFFFF),
              labelStyle: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelColor: Color(0XB2000000),
              unselectedLabelStyle: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Color(0XFF075EF5),
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              dividerHeight: 0.0,
              tabs: [
                Tab(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Text(
                      "All",
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Text(
                      "Buy",
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Text(
                      "Sell",
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Text(
                      "Rent",
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 3,
        ),
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
          border: Border(
            top: BorderSide(
              color: Color(0XFFE6E6E6),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0X3D000000),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(
                2,
                0,
              ),
            )
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 36,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                      width: double.maxFinite,
                      child: SvgPicture.asset(
                        "assets/images/img_nav_home.svg",
                      ),
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Color(0XFF407BFF),
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
                    SizedBox(
                      height: 24,
                      width: double.maxFinite,
                      child: SvgPicture.asset(
                        "assets/images/img_nav_favorite.svg",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Favorite",
                        style: TextStyle(
                          color: Color(0XFF666666),
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
                    SizedBox(
                      height: 24,
                      width: double.maxFinite,
                      child: SvgPicture.asset(
                        "assets/images/img_nav_appoint.svg",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Appointments",
                        style: TextStyle(
                          color: Color(0XFF666666),
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
                width: 32,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                      width: double.maxFinite,
                      child: SvgPicture.asset(
                        "assets/images/img_nav_inbox.svg",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Inbox",
                        style: TextStyle(
                          color: Color(0X99000000),
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
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset(
                      "assets/images/img_nav_profile.svg",
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          color: Color(0X99000000),
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
        ),
      ),
    );
  }
}
