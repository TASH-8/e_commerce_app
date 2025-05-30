import 'package:e_commerce_app/core/routing/app_router.dart';
import 'package:e_commerce_app/core/utils/app_enums.dart';
import 'package:e_commerce_app/core/utils/app_extensions.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_bloc.dart';
import 'package:e_commerce_app/features/forget_password/presentation/bloc/user_forget_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/items_bloc.dart';
import 'package:e_commerce_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:e_commerce_app/features/more/presentation/bloc/logout_bloc.dart';
import 'package:e_commerce_app/features/product/presentation/bloc/product_bloc.dart';
import 'package:e_commerce_app/features/signup/presentation/bloc/signup_user_bloc.dart';
import 'package:e_commerce_app/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SignupUserBloc signupUserBloc = getIt<SignupUserBloc>();
  final LoginBloc loginBloc = getIt<LoginBloc>();
  final UserForgetBloc forgetbloc = getIt<UserForgetBloc>();
  final LogoutBloc logoutBloc = getIt<LogoutBloc>();
  final ItemsBloc itemsBloc = getIt<ItemsBloc>()..add(GetAllItemsEvent());
  final CartBloc cartBloc = getIt<CartBloc>();

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('=========================User is currently signed out!'
            .withColor(StringColor.green));
      } else {
        debugPrint('=========================User is signed in!'
            .withColor(StringColor.green));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
        BlocProvider(create: (_) => cartBloc),
        BlocProvider(create: (_) => signupUserBloc),
        BlocProvider(create: (_) => loginBloc),
        BlocProvider(create: (_) => forgetbloc),
        BlocProvider(create: (_) => logoutBloc),
        BlocProvider(create: (_) => itemsBloc),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter().router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
