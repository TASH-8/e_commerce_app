import 'package:e_commerce_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:e_commerce_app/features/forget_reset/presentation/pages/forgot_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/homescreen.dart';
import 'package:e_commerce_app/features/login/presentation/pages/login_page.dart';
import 'package:e_commerce_app/features/product/presentation/pages/product_preview_page.dart';
import 'package:e_commerce_app/features/categories/presentation/pages/categories_page.dart';
import 'package:e_commerce_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:e_commerce_app/features/search/presentation/pages/search_screen.dart';
import 'package:e_commerce_app/features/signup/presentation/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/product',
      builder: (context, state) => const ProductPreviewScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => FirebaseAuth.instance.currentUser == null
          ?  SignUpScreen()
          : const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/forget',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/categories', // Add leading slash here
      builder: (context, state) => const CategoriesPage(),
    ),
  ]);
}
