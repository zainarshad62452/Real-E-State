// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:share_data_app/config/theme/themedark.dart';
// import 'package:share_data_app/config/theme/themelight.dart';


// enum AppTheme { light, dark }

// final themeProvider = StateProvider<AppTheme>((ref) {
//   return AppTheme.light; // Default theme
// });

// final themeDataProvider = Provider<ThemeData>((ref) {
//   final theme = ref.watch(themeProvider);
//   return theme == AppTheme.light ? Themelight.lightTheme : Themedark.darkTheme;
// });


// //  IconButton(
// //             icon: Icon(Icons.brightness_6),
// //             onPressed: () {
// //               final theme = ref.read(themeProvider.notifier);
// //               theme.state = theme.state == AppTheme.light
// //                   ? AppTheme.dark
// //                   : AppTheme.light;
// //             },
// //           ),