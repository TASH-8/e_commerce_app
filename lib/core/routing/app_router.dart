import 'package:e_commerce_app/features/forget_reset/presentation/pages/forgot_page.dart';
import 'package:e_commerce_app/features/login/presentation/pages/login_page.dart';
import 'package:e_commerce_app/features/signup/presentation/pages/signup_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
   // ignore: unused_field
   final GoRouter _router = GoRouter(
    routes: [

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
    ]
   ) ;
}