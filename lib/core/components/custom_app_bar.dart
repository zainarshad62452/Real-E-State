
import 'package:flutter/material.dart';
import 'package:realstate/core/config/theme/themecolor.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: FittedBox(
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Themecolor
                  .primary, // Specify the background color here if needed
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.arrow_back, color: Themecolor.white),
          ),
        ),
      ),
      title: const Text('iOS to iOS'),
    );
  }
}
