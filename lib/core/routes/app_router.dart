import 'package:clean_architecture_with_bloc/core/routes/route_names.dart';
import 'package:clean_architecture_with_bloc/domain/products/entities/product/product_entity.dart';
import 'package:clean_architecture_with_bloc/presentation/app_start/screen/app_start_screen.dart';
import 'package:clean_architecture_with_bloc/presentation/bottom_navigation/screen/bottom_nav_screen.dart';
import 'package:clean_architecture_with_bloc/presentation/login/screens/login_screen.dart';
import 'package:clean_architecture_with_bloc/presentation/products/screens/product_details.dart';
import 'package:clean_architecture_with_bloc/presentation/products/screens/products_screen.dart';
import 'package:clean_architecture_with_bloc/presentation/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        );
      case RouteNames.productsScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductScreen(),
        );
      case RouteNames.appStartScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => AppStartScreen(),
        );
      case RouteNames.profileScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ProfileScreen(),
        );
      case RouteNames.bottomNavScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => BottomNAvScreen(),
        );
      case RouteNames.productDetails:
        final product = settings.arguments as ProductEntity;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(product: product),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Text("No routes found")),
        );
    }
  }
}
