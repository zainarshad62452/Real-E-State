import 'package:get/get.dart';
import 'package:realstate/models/user_model1.dart';
import 'package:realstate/view/auth/email_verification_screen/emailVerification.dart';
import 'package:realstate/view/auth/buyer/login_screen/login_controller.dart';
import 'package:realstate/view/auth/buyer/login_screen/login_screen.dart';
import 'package:realstate/view/auth/buyer/signup_screen/signup_controller.dart';
import 'package:realstate/view/auth/buyer/signup_screen/signup_screen.dart';
import 'package:realstate/view/auth/seller/signup_screen/otp_screen.dart';
import 'package:realstate/view/auth/seller/signup_screen/signup_controller.dart';
import 'package:realstate/view/auth/seller/signup_screen/signup_screen.dart';
import 'package:realstate/view/buyer/buying_list/buying_list_screen.dart';
import 'package:realstate/view/buyer/buying_property/buying_property_controller.dart';
import 'package:realstate/view/buyer/buying_property/buying_property_screen.dart';
import 'package:realstate/view/buyer/chat/chat_screen.dart';
import 'package:realstate/view/buyer/chat/chats_controller.dart';
import 'package:realstate/view/buyer/chat/recent_chat_list_screen.dart';
import 'package:realstate/view/buyer/dashboard/buyer_dashboard.dart';
import 'package:realstate/view/buyer/edit_profile/edit_profile.dart';
import 'package:realstate/view/buyer/edit_profile/edit_profile_controller.dart';
import 'package:realstate/view/buyer/favorites/favorite_screen.dart';
import 'package:realstate/view/buyer/favorites/favorites_controller.dart';
import 'package:realstate/view/buyer/fillter_screen/filter_buyer_for_buyer.dart';
import 'package:realstate/view/buyer/fillter_screen/propert_app_home_filter_controller.dart';
import 'package:realstate/view/buyer/home_screen/all_properties_for_buyer.dart';
import 'package:realstate/view/buyer/home_screen/home_screen_controller.dart';
import 'package:realstate/view/buyer/home_screen/buyer_home_screen.dart';
import 'package:realstate/view/buyer/home_screen/tab_container_controller.dart';
import 'package:realstate/view/buyer/rent_property_detail/rent_proper_detail_controller.dart';
import 'package:realstate/view/buyer/rent_property_detail/rent_property_details_screen.dart';
import 'package:realstate/view/buyer/schedule_screen/all_appointments_screen.dart';
import 'package:realstate/view/buyer/schedule_screen/schedule_screen.dart';
import 'package:realstate/view/buyer/schedule_screen/schedule_screen_controller.dart';
import 'package:realstate/view/buyer/user_profile/user_profile.dart';
import 'package:realstate/view/buyer/user_profile/user_profile_controller.dart';
import 'package:realstate/view/seller/seller_dashboard/dashboard.dart';
import 'package:realstate/view/seller/seller_dashboard/dashboard_controller.dart';
import 'package:realstate/view/splash_screen.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String loginScreen = '/login_screen';
  static const String signupScreen = '/signup_screen';
  static const String sellerSignupScreen = '/seller_signup_screen';
  static const String emailVerificationScreen = '/email_verfication';
  static const String otpVerificationScreen = '/otp-verification';
  static const String propertAppHomeScreenPage =
      '/propert_app_home_screen_page';

  static const String propertAppHomeScreenTabContainerScreen =
      '/propert_app_home_screen_tab_container_screen';
  static const String filterScreenForBuyer =
      '/filter_screen_for_buyer';

  static const String initialRoute = '/initialRoute';
  static const String buyerDashboard = '/buyer_dashboard';
  static const String sellerDashboard = '/seller_dashboard';
  static const String userProfile = '/user-profile';
  static const String editProfile = '/edit-profile';
  static const String chats = '/chats-screen';
  static const String chatsDetail = '/chats-detail';
  static const String rentPropertyDetail = '/rent-property-detail';
  static const String scheduleScreen = '/schedule-screen';
  static const String favoritesScreen = '/favorites-screen';
  static const String allAppointments = '/all-appointments';
  static const String buyingList = '/buying-list';
  static const String BuyPropertyDetail = '/buy-property-detail';

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
      name: sellerSignupScreen,
      page: () => SellerSignupScreen(),
      bindings: [SellerSignupBinding()],
    ),
    GetPage(
      name: sellerDashboard,
      page: () => SellerDashboard(),
      bindings: [SellerDashboardBinding()],
    ),

    GetPage(
      name: propertAppHomeScreenTabContainerScreen,
      page: () => BuyerHomeScreen(),
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
      page: () => ChatPage(userModel: UserModel(),),
      binding: recentChatsBinding(),
    ),
    GetPage(
      name: chatsDetail,
      page: () => RecentChatsListScreen(),
    ),
    GetPage(
      name: rentPropertyDetail,
      page: () => RentPropertyScreen(),
      binding: RentPropertyBinding(),
    ),
    GetPage(
      name: scheduleScreen,
      page: () => ScheduleScreen(),
      binding: ScheduleScreenBinding(),
    ),
    GetPage(
      name: favoritesScreen,
      page: () => FavoriteScren(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: allAppointments,
      page: () => AllAppointmentsScreen(),
    ),
     GetPage(
      name: filterScreenForBuyer,
      page: () => FilterScreenForBuyer(),
      binding: FilterForBuyerBinding(),
    ),
     GetPage(
      name: BuyPropertyDetail,
      page: () => BuyPropertyScreen(),
      binding: BuyingPropertyBinding(),
    ),
  ];
}
