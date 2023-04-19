import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/model/user_model.dart';
import 'package:ar_furniture_app/features/address/screen/add_address_screen.dart';
import 'package:ar_furniture_app/features/address/screen/address_list_screen.dart';
import 'package:ar_furniture_app/features/ar_view/ar_view_screen.dart';
import 'package:ar_furniture_app/features/auth/forgot_password/screens/forgot_password_screen.dart';
import 'package:ar_furniture_app/features/auth/login/screens/login_screen.dart';
import 'package:ar_furniture_app/features/auth/register/screens/register_screen.dart';
import 'package:ar_furniture_app/features/cart/screens/cart_screen.dart';
import 'package:ar_furniture_app/features/category/screens/category_screen.dart';
import 'package:ar_furniture_app/features/checkout/screens/checkout_screen.dart';
import 'package:ar_furniture_app/features/home/home_screen.dart';
import 'package:ar_furniture_app/features/onboarding/onboarding_screen.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/product/core/screen/category_product_screen.dart';
import 'package:ar_furniture_app/features/product/product_detail/screens/product_detail_screen.dart';
import 'package:ar_furniture_app/features/product/product_list/screens/product_list_screen.dart';
import 'package:ar_furniture_app/features/profile/change_password/screens/change_password_screen.dart';
import 'package:ar_furniture_app/features/profile/core/screens/profile_screen.dart';
import 'package:ar_furniture_app/features/profile/update_profile/screens/update_profile_screen.dart';
import 'package:ar_furniture_app/features/wishlist/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case RouteConstants.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteConstants.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case RouteConstants.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case RouteConstants.changePasswordRoute:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case RouteConstants.homeRoute:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case RouteConstants.productListRoute:
        return MaterialPageRoute(builder: (_) => const ProductListScreen());
      case RouteConstants.productDetailRoute:
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(
            product: settings.arguments as Product,
          ),
        );
      case RouteConstants.categoryProductRoute:
        return MaterialPageRoute(
          builder: (_) => CategoryProductScreen(
            categoryMap: settings.arguments as Map<String, dynamic>,
          ),
        );
      case RouteConstants.arViewScreenRoute:
        return MaterialPageRoute(
          builder: (_) => ArViewScreen(
            imageUrl: settings.arguments as String,
          ),
        );
      case RouteConstants.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case RouteConstants.wishListRoute:
        return MaterialPageRoute(builder: (_) => const WishListScreen());
      case RouteConstants.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case RouteConstants.categoryRoute:
        return MaterialPageRoute(builder: (_) => const CategoryScreen());
      case RouteConstants.addressListScreenRoute:
        return MaterialPageRoute(builder: (_) => const AddressListScreen());
      case RouteConstants.addAddressScreenRoute:
        return MaterialPageRoute(
            builder: (_) => AddAddressScreen(
                  isFromCheckout: settings.arguments as bool,
                ));
      case RouteConstants.checkoutScreenRoute:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      case RouteConstants.updateProfileRoute:
        return MaterialPageRoute(
          builder: (_) => UpdateProfileScreen(
            userModel: settings.arguments as UserModel,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
