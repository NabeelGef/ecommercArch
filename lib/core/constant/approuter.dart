import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
class AppRouter {
  static String loginScreen =
      // prefs.getString("token") == null ? "/" :
      "/login";
  static const stateSignupScreen = "/stateSignupScreen";
  static const signupScreen = "/signup";
  static const otpScreen = "/OtpScreen";
  static const otpForgotPasswordScreen = "/OtpForgotPasswordScreen";
  static const forgetPasswordScreen = "/ForgetPasswordScreen";
  static const newPasswordScreen = "/NewPasswordScreen";
  static const editProfileScreen = "/EditProfileScreen";
  static const paymantsScreen = "/paymantsScreen";
  static const addCardScreen = "/AddCardScreen";
  static String locationScreen = "/";
  static String homeScreen = "/homescreen";
  static const String showCartScreen = "/showCartScreen";
  static const categoryScreen = "/categoryScreen";
  static const vendorScreen = "/productScreen";
  static const splashScreen = "/s";
  static const orderScreen = "/orderscreen";
  static const addNewAddress = "/addNewAddress";
  static const aboutUsScreen = "/aboutusscreen";
  static const privacyPolicyScreen = "/privacypolicyscreen";
  static const termsScreen = "/termsscreen";
  static const profileScreen = "/profilescreen";
  static const favoriteScreen = "/Favoritescreen";
  static const productDetailsScreen = "/productdetailsscreen";
  static const completeInfoScreen = "/completeinfoscreen";
  static const preferencesScreen = "/preferencesScreen";
  static const searchScreen = "/searchScreen";
  static const addressScreen = "/addressScreen";
  static const detailsAddressScreen = "/detailsaddressscreen";
  static const searchVendorScreen = "/searchVendorScreen";
  static final router = GoRouter(
    routes: [
      /*GoRoute(
        path: loginScreen,
        pageBuilder: (context, state) => customTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
      */
    ],
  );
}

CustomTransitionPage customTransitionPage(
    {required ValueKey<String> key, required Widget child}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      );
    },
  );
}


// FadeTransition(
//         opacity: Tween<double>(begin: 0, end: 1).animate(animation),
//         child: child,
//       );

// SlideTransition(
//         position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
//             .animate(animation),
//         // opacity: Tween<double>(begin: 0, end: 1).animate(animation),
//         child: child,
//       );


      // ScaleTransition(
      //   scale: Tween<double>(begin: 0, end: 1).animate(
      //       CurvedAnimation(parent: animation, curve: Curves.easeInBack)),

       
      //   child: child,
      // );