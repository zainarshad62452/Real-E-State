// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:realstate/view/buyer/fillter_screen/propert_app_home_filter_controller.dart';

// ignore_for_file: must_be_immutable
class ChipviewallItemWidget extends StatelessWidget {
  ChipviewallItemWidget(this.chipviewallItemModelObj, {Key? key})
      : super(
          key: key,
        );

  ChipviewallItemModel chipviewallItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 6,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          chipviewallItemModelObj.all!.value,
          style: TextStyle(
            color: (chipviewallItemModelObj.isSelected?.value ?? false)
                ? Color(0XFF075EF5)
                : Color(0XCC000000),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: (chipviewallItemModelObj.isSelected?.value ?? false),
        backgroundColor: Color(0XFFFFFFFF),
        selectedColor: Color(0XFFD8EBFF),
        shape: (chipviewallItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(0XFF075EF5),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  4,
                ))
            : RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(0XFFCCCCCC),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  4,
                ),
              ),
        onSelected: (value) {
          chipviewallItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
// ignore: must_be_immutable
// ignore_for_file: must_be_immutable