import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realstate/view/buyer/fillter_screen/widgets/chipviewall_item_widget.dart';
import 'package:realstate/view/buyer/fillter_screen/widgets/chipviewany_item_widget.dart';
import 'package:realstate/view/buyer/fillter_screen/widgets/chipviewany_one_item_widget.dart';
import 'package:realstate/view/buyer/fillter_screen/widgets/chipviewfree_item_widget.dart';
import 'propert_app_home_filter_controller.dart'; // ignore_for_file: must_be_immutable

class FilterScreenForBuyer
    extends GetWidget<PropertAppHomeFilterController> {
  const FilterScreenForBuyer({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF2F3F3),
      appBar: _buildAppBar(),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildPropertyTypeSection(),
              SizedBox(height: 24),
              _buildPriceRangeSection(),
              SizedBox(height: 24),
              _buildBedroomSection(),
              SizedBox(height: 24),
              _buildBathroomSection(),
              SizedBox(height: 24),
              _buildFacilitySection(),
              SizedBox(height: 32),
              Container(
                width: double.maxFinite,
                height: 44,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF075EF5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        22,
                      ),
                    ),
                    visualDensity: const VisualDensity(
                      vertical: -4,
                      horizontal: -4,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 8,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "App now",
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 40,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leadingWidth: 44,
      leading: Padding(
        padding: EdgeInsets.only(left: 20),
        child: SizedBox(
          height: 24,
          width: 24,
          child: SvgPicture.asset(
            "assets/images/img_arrow_left.svg",
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        "Filter Place",
        style: TextStyle(
          color: Color(0XFF000000),
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPropertyTypeSection() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Property Type",
            style: TextStyle(
              color: Color(0XFF000000),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 22),
            child: Obx(
              () => Wrap(
                runSpacing: 16,
                spacing: 16,
                children: List<Widget>.generate(
                  controller.propertAppHomeFilterModelObj.value
                      .chipviewallItemList.value.length,
                  (index) {
                    ChipviewallItemModel model = controller
                        .propertAppHomeFilterModelObj
                        .value
                        .chipviewallItemList
                        .value[index];
                    return ChipviewallItemWidget(
                      model,
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPriceRangeSection() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price Range",
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 22),
                        child: Text(
                          "\$.50",
                          style: TextStyle(
                            color: Color(0XFF075EF5),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        "\$.700",
                        style: TextStyle(
                          color: Color(0XFF075EF5),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Color(0XFFE5ECFF),
              borderRadius: BorderRadius.circular(
                6,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 14,
                  width: double.maxFinite,
                  child: SvgPicture.asset(
                    "assets/images/img_group_1171285385.svg",
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
  Widget _buildBedroomSection() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bed Room",
            style: TextStyle(
              color: Color(0XCC000000),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            width: double.maxFinite,
            child: Obx(
              () => Wrap(
                runSpacing: 12,
                spacing: 12,
                children: List<Widget>.generate(
                  controller.propertAppHomeFilterModelObj.value
                      .chipviewanyItemList.value.length,
                  (index) {
                    ChipviewanyItemModel model = controller
                        .propertAppHomeFilterModelObj
                        .value
                        .chipviewanyItemList
                        .value[index];
                    return ChipviewanyItemWidget(model);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBathroomSection() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bath Room",
            style: TextStyle(
              color: Color(0XCC000000),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            width: double.maxFinite,
            child: Obx(
              () => Wrap(
                runSpacing: 12,
                spacing: 12,
                children: List<Widget>.generate(
                  controller.propertAppHomeFilterModelObj.value
                      .chipviewanyOneItemList.value.length,
                  (index) {
                    ChipviewanyOneItemModel model = controller
                        .propertAppHomeFilterModelObj
                        .value
                        .chipviewanyOneItemList
                        .value[index];
                    return ChipviewanyOneItemWidget(model);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFacilitySection() {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Facility Place",
              style: TextStyle(
                color: Color(0XCC000000),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(right: 22),
              child: Obx(
                () => Wrap(
                  runSpacing: 12,
                  spacing: 12,
                  children: List<Widget>.generate(
                    controller.propertAppHomeFilterModelObj.value
                        .chipviewfreeItemList.value.length,
                    (index) {
                      ChipviewfreeItemModel model = controller
                          .propertAppHomeFilterModelObj
                          .value
                          .chipviewfreeItemList
                          .value[index];
                      return ChipviewfreeItemWidget(model);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
