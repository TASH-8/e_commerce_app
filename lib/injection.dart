import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() {
  // ✅ Register FirebaseAuth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // ✅ Register FirebaseFirestore
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // ✅ Initialize other dependencies
  $initGetIt(getIt);
}
