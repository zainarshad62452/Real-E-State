// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:realstate/view/buyer/fillter_screen/propert_app_home_filter_controller.dart';

// ignore_for_file: must_be_immutable
class ChipviewanyItemWidget extends StatelessWidget {
  ChipviewanyItemWidget(this.chipviewanyItemModelObj, {Key? key})
      : super(
          key: key,
        );

  ChipviewanyItemModel chipviewanyItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 6,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          chipviewanyItemModelObj.any!.value,
          style: TextStyle(
            color: (chipviewanyItemModelObj.isSelected?.value ?? false)
                ? Color(0XFF0053E3)
                : Color(0XFF000000),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        selected: (chipviewanyItemModelObj.isSelected?.value ?? false),
        backgroundColor: Color(0XFFFFFFFF),
        selectedColor: Color(0XFFD8EBFF),
        shape: (chipviewanyItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(0XFF0053E3),
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
          chipviewanyItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
// ignore: must_be_immutable
// ignore_for_file: must_be_immutable