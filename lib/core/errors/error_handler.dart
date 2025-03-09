import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/core/utils/app_enums.dart';

String mapFailureToMessage(Failure failure) {
  if (failure is FirebaseAuthFailure) {
    switch (failure.type) {
      case FirebaseAuthErrorType.emailAlreadyInUse:
        return 'Email is already in use.';
      case FirebaseAuthErrorType.invalidEmail:
        return 'Invalid email address.';
      case FirebaseAuthErrorType.operationNotAllowed:
        return 'Operation not allowed.';
      case FirebaseAuthErrorType.weakPassword:
        return 'Password is too weak.';
      case FirebaseAuthErrorType.userNotFound:
        return 'No account found with this email.';
      case FirebaseAuthErrorType.wrongPassword:
        return 'Incorrect password.';
      case FirebaseAuthErrorType.userDisabled:
        return 'User account is disabled.';
      case FirebaseAuthErrorType.tooManyRequests:
        return 'Too many requests. Try again later.';
      case FirebaseAuthErrorType.networkRequestFailed:
        return 'Network error. Check your connection.';
      case FirebaseAuthErrorType.unexpected:
        return 'An unexpected error occurred. Try again.';
      case FirebaseAuthErrorType.invalidCredential:
        return 'Invalid credentials. Please check your email and password.';
    }
  } else if (failure is ServerFailure) {
    return 'Server error.';
  } else if (failure is OfflineFailure) {
    return 'No internet connection.';
  } else {
    return 'Unexpected error.';
  }
}

FirebaseAuthErrorType mapFirebaseErrorCode(String code) {
  switch (code) {
    case 'email-already-in-use':
      return FirebaseAuthErrorType.emailAlreadyInUse;
    case 'invalid-email':
      return FirebaseAuthErrorType.invalidEmail;
    case 'operation-not-allowed':
      return FirebaseAuthErrorType.operationNotAllowed;
    case 'weak-password':
      return FirebaseAuthErrorType.weakPassword;
    case 'user-not-found':
      return FirebaseAuthErrorType.userNotFound;
    case 'wrong-password':
      return FirebaseAuthErrorType.wrongPassword;
    case 'user-disabled':
      return FirebaseAuthErrorType.userDisabled;
    case 'too-many-requests':
      return FirebaseAuthErrorType.tooManyRequests;
    case 'network-request-failed':
      return FirebaseAuthErrorType.networkRequestFailed;
    case 'invalid-credential':
      return FirebaseAuthErrorType.invalidCredential;
    default:
      return FirebaseAuthErrorType.unexpected;
  }
}
