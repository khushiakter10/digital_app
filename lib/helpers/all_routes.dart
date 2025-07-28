import 'dart:io';
import 'package:digital_app/features/advertiser/advertiser-profile/advertiser_profile/presentation/Advertiser_profile_screen.dart';
import 'package:digital_app/features/advertiser/advertiser-profile/advertiser_profile/presentation/advertiser_edit_personal_info_screen.dart';
import 'package:digital_app/features/advertiser/advertiser-profile/advertiser_profile/presentation/helper_center_screen.dart';
import 'package:digital_app/features/advertiser/advertiser_all_vedio/presentation/advertiser_all_vedio_screen.dart';
import 'package:digital_app/features/advertiser/advertiser_auth/advertiser_forgot_password/presentation/advertiser_forgot_otp_verification.dart';
import 'package:digital_app/features/advertiser/advertiser_auth/advertiser_forgot_password/presentation/advertiser_reset_password_screen.dart';
import 'package:digital_app/features/advertiser/advertiser_auth/advertiser_information_auth_screen/presentation/advertiser_information_auth_screen.dart';
import 'package:digital_app/features/advertiser/advertiser_auth/advertiser_login_screen/presentation/advertiser_login_screen.dart';
import 'package:digital_app/features/advertiser/advertiser_auth/advertiser_signup_screen/presentation/advertiser_signup_otp_verification_screen.dart';
import 'package:digital_app/features/advertiser/advertiser_auth/advertiser_signup_screen/presentation/advertiser_signup_screen.dart';
import 'package:digital_app/features/advertiser/advertiser_bottom_nav_screen.dart';
import 'package:digital_app/features/advertiser/advertiser_create_new_ad/presentation/advertiser_create_new_ad_screen.dart';
import 'package:digital_app/features/advertiser/advertiser_home/presentation/advertiser_home_screen.dart';
import 'package:digital_app/features/advertiser/advertiser_subcription/presentation/advertiser_subcription_screen.dart';
import 'package:digital_app/features/advertiser/advertiser_title/presentation/advertiser_title_screen.dart';
import 'package:digital_app/features/advertiser/targate_category/presentation/targate_category_screen.dart';
import 'package:digital_app/features/advertiser/vedio_source/presentation/video_source_screen.dart';
import 'package:digital_app/features/merchant/edit_stor_information/presentation/merchant_edit_stor_information_screen.dart';
import 'package:digital_app/features/merchant/merchant-home_screen/presentation/merchant_home_screen.dart';
import 'package:digital_app/features/merchant/merchant-home_screen/presentation/merchant_scan_qr_code_screen.dart';
import 'package:digital_app/features/merchant/merchant-home_screen/presentation/merchant_transaction_log_screen.dart';
import 'package:digital_app/features/merchant/merchant_add_offer/basic_info/presentation/basic_info_screen.dart';
import 'package:digital_app/features/merchant/merchant_add_offer/optional_settings/presentation/optional_settings_screen.dart';
import 'package:digital_app/features/merchant/merchant_add_offer/redemption_rulse/presentation/redemption_rulse_screen.dart';
import 'package:digital_app/features/merchant/merchant_add_offer/validity_and_timing/presentation/validity_and_timing_screen.dart';
import 'package:digital_app/features/merchant/merchant_auth/merchant_forgot_password/presentation/merchant_forget_password.dart';
import 'package:digital_app/features/merchant/merchant_auth/merchant_forgot_password/presentation/merchant_forgot_otp_verification.dart';
import 'package:digital_app/features/merchant/merchant_auth/merchant_information_screen/presentation/merchant_information_screen.dart';
import 'package:digital_app/features/merchant/merchant_auth/merchant_log_in_screen/presentation/merchant_login_screen.dart';
import 'package:digital_app/features/merchant/merchant_auth/merchant_reset_password/presentation/merchant_reset_password_screen.dart';
import 'package:digital_app/features/merchant/merchant_auth/merchant_signup/presentation/merchant_signup_screen.dart';
import 'package:digital_app/features/merchant/merchant_bottom_nav_screen.dart';
import 'package:digital_app/features/merchant/merchant_profile/merchant_profile/presentation/merchant_helper_center_screen.dart';
import 'package:digital_app/features/merchant/merchant_profile/merchant_profile/presentation/merchant_notification_screen.dart';
import 'package:digital_app/features/merchant/merchant_profile/merchant_profile/presentation/merchant_profile.dart';
import 'package:digital_app/features/merchant/merchant_profile/merchant_profile/presentation/merchant_update_password_screen.dart';
import 'package:digital_app/features/user_section/Profile/user_profile/presentation/edit_personal_info_screen.dart';
import 'package:digital_app/features/user_section/Profile/user_profile/presentation/helper_center_screen.dart';
import 'package:digital_app/features/user_section/Profile/user_profile/presentation/user_notification_screen.dart';
import 'package:digital_app/features/user_section/Profile/user_profile/presentation/user_profile_screen.dart';
import 'package:digital_app/features/user_section/Profile/user_profile/presentation/user_update_pesword_screen.dart';
import 'package:digital_app/features/user_section/auth/log_in_screen/presentation/login_screen.dart';
import 'package:digital_app/features/user_section/auth/user_forgot_password/presentation/user_forgot_otp_verification_screen.dart';
import 'package:digital_app/features/user_section/auth/user_forgot_password/presentation/user_forgot_password_screen.dart';
import 'package:digital_app/features/user_section/auth/user_forgot_password/presentation/user_reset_password_screen.dart';
import 'package:digital_app/features/user_section/auth/user_signup_screen/presentation/signup_otp_verification_screen.dart';
import 'package:digital_app/features/user_section/auth/user_signup_screen/presentation/user_signup_screen.dart';
import 'package:digital_app/features/user_section/subscription/presentation/user_subscription.dart';
import 'package:digital_app/features/user_section/user_home_section/presentation/discount_redemption.dart';
import 'package:digital_app/features/user_section/user_home_section/presentation/home_offer_details_screen.dart';
import 'package:digital_app/features/user_section/user_home_section/presentation/scan_qr_code.dart';
import 'package:digital_app/features/user_section/user_home_section/presentation/user_id_card_screen.dart';
import 'package:flutter/cupertino.dart';
import '../features/advertiser/advertiser-profile/advertiser_profile/presentation/Advertiser_update_pesword_screen.dart';
import '../features/advertiser/advertiser_auth/advertiser_forgot_password/presentation/advertiser_forgot_password_screen.dart';
import '../features/advertiser/advertiser_notification/presentation/advertiser_notification_screen.dart';
import '../features/merchant/merchant_auth/merchant_signup/presentation/merchant_signup_otp_verification_screen.dart';
import '../features/merchant/merchant_profile/merchant_profile/presentation/merchant_edit_personal_info_screen.dart';
import '../features/user_section/bottom_nav_screen.dart';


final class Routes {
  static final Routes _routes = Routes._internal();

  Routes._internal();

  static Routes get instance => _routes;

  ///===================Authentication Routes========================

  static const String homeScreen = '/homeScreen';
  static const String userLoginScreen = '/userLoginScreen';
  static const String userSignUpScreen = '/userSignUpScreen';
  static const String userSignupOtpVerificationScreen = '/userSignupOtpVerificationScreen';
  static const String userSubscriptionScreen = '/userSubscriptionScreen';
  static const String userForgotPasswordScreen = '/userForgotPasswordScreen';
  static const String userResetPasswordScreen = '/userResetPasswordScreen';

  static const String userForgotOTPVerificationScreen = '/userForgotOTPVerificationScreen';

  static const String userUpdatePassword = '/userUpdatePassword';
  static const String merchantUpdatePasswordScreen = '/merchantUpdatePasswordScreen';
  static const String advertiserAllVedioScreen = '/advertiserAllVedioScreen';
  static const String advertiserTitleScreen = '/advertiserTitleScreen';

  static const String videoSourceScreen = '/videoSourceScreen';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String forgetOTPVerificationScreen = '/forgetOTPVerificationScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String forgetSuccess = '/forgetSuccess';
  static const String advertiserHelpCenter = '/advertiserHelpCenter';

  ///===================Home Routes========================
  static const String featuredCoachesScreen = '/featuredCoachesScreen';
  static const String featuredCoachesDetails = '/featuredCoachesDetails';
  static const String bookNowScreen = '/bookNowScreen';
  static const String enterDetailsScreen = '/enterDetailsScreen';
  ///=========================Bottom Navigation Routes========================
  static const String userMainBottomNavScreen = '/userMainBottomNavScreen';

  ///===================User Profile Section========================
  static const String editPersonalInfoScreen = '/editPersonalInfoScreen';
  static const String advertiserEditPersonalInfoScreen = '/advertiserEditPersonalInfoScreen';
  static const String userNotificationScreen = '/userNotificationScreen';
  static const String advertiserNotificationScreen = '/advertiserNotificationScreen';
  static const String helperCenterScreen = '/helperCenterScreen';
  static const String userHomeOfferDetailsScreen = '/userHomeOfferDetailsScreen';
  static const String userDiscountRedemption = '/userDiscountRedemption';
  static const String userScanQrCodeScreen = '/userScanQrCodeScreen';
  static const String merchantScanQrCodeScreen = '/merchantScanQrCodeScreen';
  static const String userIdCardScreen = '/userIdCardScreen';
  static const String advertiserBottomNavScreen = '/advertiserBottomNavScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String targateCategoryScreen = '/targateCategoryScreen';
  static const String merchantBottomNavScreen = '/merchantBottomNavScreen';


////////////////////////////////////////////////khusbu////////////////////////////////////////////////////////////

  static const String basicInfoScreen = '/basicInfoScreen';
  static const String redemptionRulseScreen = '/redemptionRulseScreen';
  static const String validityAndTimingScreen = '/validityAndTimingScreen';
  static const String optionalSettingScreen = '/optionalSettingScreen';

  static const String merchantEditPersonalInfoScreen = '/merchantEditPersonalInfoScreen';
  static const String merchantNotificationScreen = '/merchantNotificationScreen';
  static const String merchantHelperCenterScreen = '/merchantHelperCenterScreen';
  static const String merchantInformationScreen = '/merchantInformationScreen';

  static const String userHelperCenterScreen = '/userHelperCenterScreen';
  static const String advertiserUpdatePasswordScreen = '/advertiserUpdatePasswordScreen';



  static const String merchantHomeScreen = '/merchantHomeScreen';
  static const String merchantLoginScreen = '/merchantLoginScreen';
  static const String merchantSignupScreen = '/merchantSignupScreen';
  static const String merchantSignupOtpVerificationScreen = '/merchantSignupOtpVerificationScreen';
  static const String merchantForgetPassword = '/merchantForgetPassword';
  static const String advertiserForgotOtpVerificationScreen = '/advertiserForgotOtpVerificationScreen';
  static const String merchantForgotOtpVerification = '/merchantForgotOtpVerification';
  static const String merchantTransactionLogScreen = '/merchantTransactionLogScreen';





  //----------------------------------------------------- advertiser --------------------------------------------------//


  static const String advertiserLoginScreen = '/advertiserLoginScreen';
  static const String advertiserForgetPasswordScreen = '/advertiserForgetPasswordScreen';
  static const String advertiserSignupScreen = '/advertiserSignupScreen';
  static const String advertiserProfileScreen = '/advertiserProfileScreen';
  static const String advertiserSignupOtpVerificationScreen = '/advertiserSignupOtpVerificationScreen';
  static const String advertiserInformationAuthScreen = '/advertiserInformationAuthScreen';
  static const String advertiserSubcriptionScreen = '/advertiserSubcriptionScreen';
  static const String advertiserHomeScreen = '/advertiserHomeScreen';
  static const String advertiserCreateNewAdScreen = '/advertiserCreateNewAdScreen';
  static const String advertiserResetPasswordScreen = '/advertiserResetPasswordScreen';
  static const String merchantResetPasswordScreen1 = '/merchantResetPasswordScreen1';
  static const String userProfileScreen = '/userProfileScreen';
  static const String merchantEditStorInformationScreen = '/merchantEditStorInformationScreen';
  static const String merchantProfile = '/merchantProfile';




// Add other routes here as needed
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();

  RouteGenerator._internal();

  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
    ///===================Authentication Routes========================


      case Routes.merchantEditPersonalInfoScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantEditPersonalInfoScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => MerchantEditPersonalInfoScreen());
        }

      case Routes.advertiserHelpCenter:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserHelperCenterScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => AdvertiserHelperCenterScreen());
        }


      case Routes.advertiserUpdatePasswordScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserUpdatePasswordScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => AdvertiserUpdatePasswordScreen());
        }

      case Routes.advertiserEditPersonalInfoScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserEditPersonalInfoScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => AdvertiserEditPersonalInfoScreen());
        }

     case Routes.merchantBottomNavScreen:
            if (Platform.isAndroid) {
              return FadedTransitionRoute(
                  widget: MerchantBottomNavScreen(), settings: settings);
            } else {
              return CupertinoPageRoute(builder: (context) => MerchantBottomNavScreen());
            }

      case Routes.merchantHomeScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantHomeScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => MerchantHomeScreen());
        }

      case Routes.merchantInformationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantInformationScreen(onChanged: (bool ) {  },), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => MerchantInformationScreen(onChanged: (bool ) {  },));
        }



      case Routes.merchantLoginScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantLoginScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => MerchantLoginScreen());
        }
//--------------------------------- User Profile ------------------------------------//
      case Routes.userProfileScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserProfileScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => UserProfileScreen());
        }
//------------------------------------------------------   ---------------------------//
      case Routes.merchantSignupScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantSignupScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => MerchantSignupScreen());
        }



 case Routes.merchantEditStorInformationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantEditStorInformationScreen(onChanged: (bool ) {  },), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => MerchantEditStorInformationScreen(onChanged: (bool ) {  },));
        }

///// Location //////////////////////////////






      case Routes.merchantSignupOtpVerificationScreen:
        final args = settings.arguments as Map;
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantSignupOtpVerificationScreen(
                email: args["email"],
              ),
              settings: settings);
        } else {
          return CupertinoPageRoute(
            builder: (context) => MerchantSignupOtpVerificationScreen(
              email: args["email"],
            ),
          );
        }


      case Routes.advertiserForgotOtpVerificationScreen:
        final args = settings.arguments as Map;
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserForgotOtpVerificationScreen(
                email: args["email"],
              ),
              settings: settings);
        } else {
          return CupertinoPageRoute(
            builder: (context) => MerchantSignupOtpVerificationScreen(
              email: args["email"],
            ),
          );
        }


      case Routes.merchantForgotOtpVerification:
        final args = settings.arguments as Map;
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantForgotOtpVerification(
                email: args["email"],
              ),
              settings: settings);
        }
        else {
          return CupertinoPageRoute(
            builder: (context) => MerchantForgotOtpVerification(
              email: args["email"],
            ),
          );
        }






//--------------------------------------------- Advertiser -----------------------------------------------------//

      case Routes.advertiserLoginScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserLoginScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => AdvertiserLoginScreen());
        }

  case Routes.advertiserResetPasswordScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserResetPasswordScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => AdvertiserResetPasswordScreen());
        }



      case Routes.advertiserSignupScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserSignupScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => AdvertiserSignupScreen());
        }


      case Routes.advertiserForgetPasswordScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserForgetPasswordScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => AdvertiserForgetPasswordScreen());
        }


      case Routes.merchantForgetPassword:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantForgetPassword(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => MerchantForgetPassword());
        }

      case Routes.advertiserInformationAuthScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserInformationAuthScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => AdvertiserInformationAuthScreen());
        }

      case Routes.advertiserSubcriptionScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserSubcriptionScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => AdvertiserSubcriptionScreen());
        }


      case Routes.advertiserHomeScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserHomeScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => AdvertiserHomeScreen());
        }


      case Routes.advertiserCreateNewAdScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserCreateNewAdScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => AdvertiserCreateNewAdScreen());
        }

      case Routes.merchantTransactionLogScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantTransactionLogScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => MerchantTransactionLogScreen());
        }



      case Routes.advertiserNotificationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserNotificationScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => AdvertiserNotificationScreen());
        }

      case Routes.merchantNotificationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantNotificationScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => MerchantNotificationScreen());
        }

      case Routes.merchantResetPasswordScreen1:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantResetPasswordScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => MerchantResetPasswordScreen());
        }






//-------------------------------------------------------- stop ------------------------------------------------------//


      case Routes.userLoginScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserLoginScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => UserLoginScreen());
        }

      case Routes.userDiscountRedemption:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserDiscountRedemption(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => UserDiscountRedemption());
        }

      case Routes.targateCategoryScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: TargateCategoryScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => TargateCategoryScreen());
        }
      case Routes.advertiserAllVedioScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserAllVedioScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => AdvertiserAllVedioScreen());
        }

      case Routes.videoSourceScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: VideoSourceScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => VideoSourceScreen());
        }
      case Routes.advertiserTitleScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserTitleScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => AdvertiserTitleScreen());
        }
    // case Routes.userScanQrCodeScreen:
    // if (Platform.isAndroid) {
    //   return FadedTransitionRoute(
    //       widget: UserScanQrCodeScreen(), settings: settings);
    // } else {
    //   return CupertinoPageRoute(builder: (context) => UserScanQrCodeScreen());
    // }


      case Routes.advertiserBottomNavScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserBottomNavScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => AdvertiserBottomNavScreen());
        }


      case Routes.userSignUpScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserSignupScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => UserSignupScreen());
        }



      case Routes.advertiserProfileScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserProfileScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => AdvertiserProfileScreen());
        }
      case Routes.merchantHelperCenterScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantHelperCenterScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => MerchantHelperCenterScreen());
        }
      case Routes.userHelperCenterScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: userHelperCenterScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => userHelperCenterScreen());
        }

      case Routes.userIdCardScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserIdCardScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => UserIdCardScreen());
        }

      case Routes.userHomeOfferDetailsScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserHomeOfferDetailsScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => UserHomeOfferDetailsScreen());
        }

    /////////////////////////////////// Khusbu //////////////////////////////////////


      case Routes.basicInfoScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: BasicInfoScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => BasicInfoScreen());
        }

      case Routes.redemptionRulseScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: RedemptionRulseScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => RedemptionRulseScreen());
        }


      case Routes.validityAndTimingScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ValidityAndTimingScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => ValidityAndTimingScreen());
        }

      case Routes.optionalSettingScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: OptionalSettingScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => OptionalSettingScreen());
        }


      case Routes.merchantProfile:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantProfile(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => MerchantProfile());
        }







      case Routes.editPersonalInfoScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserEditPersonalInfoScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => UserEditPersonalInfoScreen());
        }

      case Routes.userScanQrCodeScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserScanQrCodeScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => UserScanQrCodeScreen());
        }

      case Routes.merchantScanQrCodeScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantScanQrCodeScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => MerchantScanQrCodeScreen());
        }


      case Routes.userSubscriptionScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserSubscriptionScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => UserSubscriptionScreen());
        }

//------------------------------------ User --------------------------------------------------//


      case Routes.userForgotOTPVerificationScreen:
        final args = settings.arguments as Map;
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserForgotOTPVerificationScreen(
                email: args["email"],
              ),
              settings: settings);
        }
        else {
          return CupertinoPageRoute(
            builder: (context) => UserForgotOTPVerificationScreen(
              email: args["email"],
            ),
          );
        }


      case Routes.userForgotPasswordScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserForgotPasswordScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => UserForgotPasswordScreen());
        }


      case Routes.userResetPasswordScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserResetPasswordScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => UserResetPasswordScreen());
        }


//------------------------------------------------------ User --------------------------------------







      case Routes.userUpdatePassword:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserUpdatePassword(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => UserUpdatePassword());
        }

      case Routes.merchantUpdatePasswordScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MerchantUpdatePasswordScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => MerchantUpdatePasswordScreen());
        }




      case Routes.userNotificationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserNotificationScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => UserNotificationScreen());
        }



      case Routes.userSignupOtpVerificationScreen:
        final args = settings.arguments as Map;
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserSignupOtpVerificationScreen(
                email: args["email"],
              ),
              settings: settings);
        } else {
          return CupertinoPageRoute(
            builder: (context) => UserSignupOtpVerificationScreen(
              email: args["email"],
            ),
          );
        }


      case Routes.advertiserSignupOtpVerificationScreen:
        final args = settings.arguments as Map;
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdvertiserSignupOtpVerificationScreen(
                email: args["email"],
              ),
              settings: settings);
        } else {
          return CupertinoPageRoute(
            builder: (context) => AdvertiserSignupOtpVerificationScreen(
              email: args["email"],
            ),
          );
        }
    //
    // case Routes.forgetOTPVerificationScreen:
    //   final args = settings.arguments as Map;
    //   if (Platform.isAndroid) {
    //     return FadedTransitionRoute(
    //         widget: ForgetOTPVerificationScreen(
    //           email: args["email"],
    //         ),
    //         settings: settings);
    //   } else {
    //     return CupertinoPageRoute(
    //       builder: (context) => ForgetOTPVerificationScreen(
    //         email: args["email"],
    //       ),
    //     );
    //   }
    //
    // case Routes.resetPasswordScreen:
    //   final args = settings.arguments as Map;
    //   if (Platform.isAndroid) {
    //     return FadedTransitionRoute(
    //         widget: ResetPasswordScreen(
    //           email: args["email"],
    //           otp: args["otp"],
    //         ),
    //         settings: settings);
    //   } else {
    //     return CupertinoPageRoute(
    //       builder: (context) => ResetPasswordScreen(
    //         email: args["email"],
    //         otp: args["otp"],
    //       ),
    //     );
    //   }

    ///===================Home Routes========================
    // case Routes.homeScreen:
    //   if (Platform.isAndroid) {
    //     return FadedTransitionRoute(widget: HomeScreen(), settings: settings);
    //   } else {
    //     return CupertinoPageRoute(builder: (context) => HomeScreen());
    //   }
    //
    //
    // case Routes.featuredCoachesScreen:
    //   if (Platform.isAndroid) {
    //     return FadedTransitionRoute(widget: FeaturedCoachesScreen(), settings: settings);
    //   } else {
    //     return CupertinoPageRoute(builder: (context) => FeaturedCoachesScreen());
    //   }
    //
    // case Routes.featuredCoachesDetails:
    //   if (Platform.isAndroid) {
    //     return FadedTransitionRoute(widget: FeaturedCoachesDetails(), settings: settings);
    //   } else {
    //     return CupertinoPageRoute(builder: (context) => FeaturedCoachesDetails());
    //   }
    //
    // case Routes.bookNowScreen:
    //   if (Platform.isAndroid) {
    //     return FadedTransitionRoute(widget: BookNowScreen(), settings: settings);
    //   } else {
    //     return CupertinoPageRoute(builder: (context) => BookNowScreen());
    //   }
    //
    // case Routes.enterDetailsScreen:
    //   if (Platform.isAndroid) {
    //     return FadedTransitionRoute(widget: EnterDetailsScreen(), settings: settings);
    //   } else {
    //     return CupertinoPageRoute(builder: (context) => EnterDetailsScreen());
    //   }

    ///===================Bottom Navigation Routes========================
      case Routes.userMainBottomNavScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: UserMainBottomNavScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(builder: (context) => UserMainBottomNavScreen());
        }

      default:
        return null;
    }
  }
}

class FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  FadedTransitionRoute({required this.widget, required this.settings})
      : super(
    settings: settings,
    reverseTransitionDuration: const Duration(milliseconds: 1),
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionDuration: const Duration(milliseconds: 1),
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        ),
        child: child,
      );
    },
  );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}