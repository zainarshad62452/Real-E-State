// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:realstate/config/theme/themecolor.dart';
import 'package:realstate/core/extension/media_query.dart';
import 'package:realstate/core/extension/widget_gap.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onPressed;

  Icon? icon;
  String? image;
  String label;

  CustomButton(
      {super.key,
      required this.onPressed,
      this.icon,
      this.image,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white),
            ),
            const WidgetGap(),
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Themecolor.white,
                ),
                padding: const EdgeInsets.all(4),
                height: context.height / 25,
                width: context.width / 12,
                child: icon != null ? icon : Image.asset(image ?? '')
                // Image.asset(AppAssetPaths.dataTransfer)
        
                ),
          ],
        ),
      ),
    );
  }
}
