import 'package:bitcommerz/features/auth/presentation/pages/privacy_policy.dart';
import 'package:bitcommerz/features/auth/presentation/pages/terms_and_cons.dart';
import 'package:flutter/material.dart';
import 'package:bitcommerz/config/navigation/route_name.dart';
import 'package:bitcommerz/features/auth/presentation/pages/forgot_password.dart';
import 'package:bitcommerz/features/auth/presentation/pages/login.dart';
import 'package:bitcommerz/features/auth/presentation/pages/otp_screen.dart';
import 'package:bitcommerz/features/auth/presentation/pages/package_select.dart';
import 'package:bitcommerz/features/auth/presentation/pages/registation.dart';
import 'package:bitcommerz/features/auth/presentation/pages/shop_setup.dart';
import 'package:bitcommerz/features/brand/data/model/brand_model.dart';
import 'package:bitcommerz/features/brand/presentation/pages/brand_create_screen.dart';
import 'package:bitcommerz/features/brand/presentation/pages/brand_list_page.dart';
import 'package:bitcommerz/features/category/data/model/category_model.dart';
import 'package:bitcommerz/features/category/presentation/pages/category.dart';
import 'package:bitcommerz/features/category/presentation/pages/category_create_screen.dart';
import 'package:bitcommerz/features/dashboard/presentation/pages/dashboard.dart';
import 'package:bitcommerz/features/image_bucket/presentation/pages/image_bucket_screen.dart';
import 'package:bitcommerz/features/launcher/presentation/pages/launcher_screen.dart';
import 'package:bitcommerz/features/launcher/presentation/pages/onboarding_screen.dart';
import 'package:bitcommerz/features/leanding/presentation/pages/leanding_screen.dart';
import 'package:bitcommerz/features/order/data/model/order_model.dart';
import 'package:bitcommerz/features/order/presentation/pages/edit_order_screen.dart';
import 'package:bitcommerz/features/order/presentation/pages/order_screen.dart';
import 'package:bitcommerz/features/products/data/model/product_list_model.dart';
import 'package:bitcommerz/features/products/presentation/pages/create_product_screen.dart';
import 'package:bitcommerz/features/products/presentation/pages/product_screen.dart';
import 'package:bitcommerz/features/products/presentation/pages/update_product_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(
          builder: (_) => const LauncherScreen(),
          settings: settings,
        );
      case RouteName.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
          settings: settings,
        );
      case RouteName.leandingScreen:
        return MaterialPageRoute(
          builder: (_) => const LeandingScreen(),
          settings: settings,
        );
      case RouteName.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );
      case RouteName.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgotPassword(),
          settings: settings,
        );
      case RouteName.verifyOTPScreen:
        final args = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => VerifyOTPScreen(
            email: args!,
          ),
          settings: settings,
        );
      case RouteName.registationScreen:
        return MaterialPageRoute(
          builder: (_) => const RegistationScreen(),
          settings: settings,
        );
      case RouteName.shopUpdateScreen:
        return MaterialPageRoute(
          builder: (_) => const ShopUpdateScreen(),
          settings: settings,
        );
      case RouteName.dashboard:
        return MaterialPageRoute(
          builder: (_) => const Dashboard(),
          settings: settings,
        );
      case RouteName.brandScreen:
        return MaterialPageRoute(
          builder: (_) => const BrandPage(),
          settings: settings,
        );
      case RouteName.createbrandScreen:
        final args = settings.arguments as BrandList?;
        return MaterialPageRoute(
          builder: (_) => CreateBrandScreen(
            brandList: args!,
          ),
          settings: settings,
        );
      case RouteName.imageBucketScreen:
        return MaterialPageRoute(
          builder: (_) => const ImageBucketScreen(),
          settings: settings,
        );
      case RouteName.categoryCreateScreen:
        final args = settings.arguments as CategoryList?;
        return MaterialPageRoute(
          builder: (_) => CategoryCreateScreen(categoryList: args!),
          settings: settings,
        );
      case RouteName.packageSelectScreen:
        return MaterialPageRoute(
          builder: (_) => const PackageSelectScreen(),
          settings: settings,
        );
      case RouteName.termsAndConsScreen:
        return MaterialPageRoute(
          builder: (_) => TermsAndConditionsPage(),
          settings: settings,
        );
        case RouteName.privacyAndPolicyScreen:
        return MaterialPageRoute(
          builder: (_) => const PrivacyAndPolicyPage(),
          settings: settings,
        );
      case RouteName.productScreen:
        return MaterialPageRoute(
          builder: (_) => const ProductScreen(),
          settings: settings,
        );
      case RouteName.orderScreen:
        return MaterialPageRoute(
          builder: (_) => const OrderScreen(),
          settings: settings,
        );
      case RouteName.categoryScreen:
        return MaterialPageRoute(
          builder: (_) => const CategoryScreen(),
          settings: settings,
        );

      case RouteName.editOrderScreen:
        final argument = settings.arguments as OrderList?;
        return MaterialPageRoute(
          builder: (_) => EditOrderScreen(orderList: argument!),
          settings: settings,
        );
      case RouteName.createproductScreen:
        return MaterialPageRoute(
          builder: (_) => CreateProductScreen(),
          settings: settings,
        );

      case RouteName.updateProductScreen:
        final args = settings.arguments as Products?;
        return MaterialPageRoute(
          builder: (_) => UpdateProductScreen(
            product: args!,
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const LauncherScreen(),
          settings: settings,
        );
    }
  }
}
