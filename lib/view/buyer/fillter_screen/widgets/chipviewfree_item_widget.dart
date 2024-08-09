// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:realstate/view/buyer/fillter_screen/propert_app_home_filter_controller.dart';

class ChipviewfreeItemWidget extends StatelessWidget {
  ChipviewfreeItemWidget(this.chipviewfreeItemModelObj, {Key? key})
      : super(
          key: key,
        );

  ChipviewfreeItemModel chipviewfreeItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          chipviewfreeItemModelObj.freeWifi!.value,
          style: TextStyle(
            color: Color(0XFF000000),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: (chipviewfreeItemModelObj.isSelected?.value ?? false),
        backgroundColor: Color(0XFFFFFFFF),
        selectedColor: Color(0XFFFFFFFF),
        shape: (chipviewfreeItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(0X99FFFFFF),
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
          chipviewfreeItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
