import 'package:get/get.dart';
import 'package:realstate/view/auth/email_verification_screen/emailVerification.dart';
import 'package:realstate/view/auth/login_screen/login_controller.dart';
import 'package:realstate/view/auth/login_screen/login_screen.dart';
import 'package:realstate/view/auth/signup_screen/signup_controller.dart';
import 'package:realstate/view/auth/signup_screen/signup_screen.dart';
import 'package:realstate/view/buyer/chats/chats_controller.dart';
import 'package:realstate/view/buyer/chats/chats_screen.dart';
import 'package:realstate/view/buyer/chats_details/chat_detail_controller.dart';
import 'package:realstate/view/buyer/chats_details/chats_details_screen.dart';
import 'package:realstate/view/buyer/dashboard/dashboard.dart';
import 'package:realstate/view/buyer/edit_profile/edit_profile.dart';
import 'package:realstate/view/buyer/edit_profile/edit_profile_controller.dart';
import 'package:realstate/view/buyer/home_screen/home_screen.dart';
import 'package:realstate/view/buyer/home_screen/home_screen_controller.dart';
import 'package:realstate/view/buyer/home_screen/tab_container.dart';
import 'package:realstate/view/buyer/home_screen/tab_container_controller.dart';
import 'package:realstate/view/buyer/user_profile/user_profile.dart';
import 'package:realstate/view/buyer/user_profile/user_profile_controller.dart';
import 'package:realstate/view/splash_screen.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String loginScreen = '/login_screen';
  static const String signupScreen = '/signup_screen';
  static const String emailVerificationScreen = '/email_verfication';
  static const String propertAppHomeScreenPage =
      '/propert_app_home_screen_page';

  static const String propertAppHomeScreenTabContainerScreen =
      '/propert_app_home_screen_tab_container_screen';
  static const String propertAppHomeFilterScreen =
      '/propert_app_home_filter_screen';

  static const String initialRoute = '/initialRoute';
  static const String buyerDashboard = '/buyer_dashboard';
  static const String userProfile = '/user-profile';
  static const String editProfile = '/edit-profile';
  static const String chats = '/chats-screen';
  static const String chatsDetail = '/chats-detail';

  static List<GetPage> pages = [
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: emailVerificationScreen,
      page: () => EmailVerification(),
      bindings: [],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [],
    ),
    GetPage(
      name: signupScreen,
      page: () => SignupScreen(),
      bindings: [SignupBinding()],
    ),
    
    GetPage(
      name: propertAppHomeScreenTabContainerScreen,
      page: () => HomeScreenPage(),
      bindings: [HomeScreenPageBindings()],
    ),
    GetPage(
      name: propertAppHomeScreenPage,
      page: () => HomeScreen(),
      bindings: [PropertAppHomeScreenBinding()],
    ),
    GetPage(
          name: buyerDashboard,
          page: () => DashboardScreen(),
          binding: DashboardBinding(),
        ),
        GetPage(
      name: userProfile,
      page: () => UserProfileScreen(),
      binding: UserProfileBinding(),
    ),
     GetPage(
      name: editProfile,
      page: () => EditProfileScreen(),
      binding: EditProfileBinding(),
    ),
     GetPage(
      name: chats,
      page: () => ChatScreen(),
      binding: ChatsBinding(),
    ),
     GetPage(
      name: chatsDetail,
      page: () => ChatDetailScreen(),
      binding: ChatsDetailBinding(),
    ),
  ];
}
