import 'package:flutter/material.dart';
import 'package:store/app/modules/cart_pages/cart_page.dart';
import 'package:store/app/modules/home_pages/home_page.dart';
import 'package:store/app/modules/home_pages/view/details_product_view.dart';
import 'package:store/app/modules/login_pages/login_page.dart';

class AppRoute {
  MaterialPageRoute genereateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return MaterialPageRoute(
            builder: (context) => const LoginPage(), settings: settings);
      case HomePage.routeName:
        return MaterialPageRoute(
            builder: (context) => const HomePage(), settings: settings);

      case DetailsProductView.routeName:
        return MaterialPageRoute(
            builder: (context) => const DetailsProductView(),
            settings: settings);
      case CartPage.routeName:
        return MaterialPageRoute(builder: (context) => const CartPage());
      default:
        return MaterialPageRoute(
            builder: (context) => const LoginPage(), settings: settings);
    }
  }
}

class Routes {
  static const root = '/';
  static const login = '/LoginPage';
  static const home = '/HomePage';
  static const details = '/DetailsPage';
  static const cart = '/CartPage';
}
