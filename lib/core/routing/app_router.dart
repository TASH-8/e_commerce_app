import 'package:e_commerce_app/features/forget_reset/presentation/pages/forgot_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/homescreen.dart';
import 'package:e_commerce_app/features/login/presentation/pages/login_page.dart';
import 'package:e_commerce_app/features/product/presentation/pages/product_preview_page.dart';
import 'package:e_commerce_app/features/signup/presentation/pages/signup_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/product',
      builder: (context, state) => const ProductPreviewScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/forget',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
  ]);
}
