class FirebaseAuthenticationException implements Exception {
  final String message;

  const FirebaseAuthenticationException(
      [this.message = 'Something unexpected happened. Please try again.']);

  factory FirebaseAuthenticationException.fromFirebaseException(dynamic e) {
    switch (e.code) {
      case 'admin-restricted-operation':
        return const FirebaseAuthenticationException(
            'This operation is restricted to administrators.');
      case 'argument-error':
        return const FirebaseAuthenticationException(
            'There was an error with the information provided. Please try again.');
      case 'app-not-authorized':
        return const FirebaseAuthenticationException(
            'This app is not authorized for the requested operation.');
      case 'app-not-installed':
        return const FirebaseAuthenticationException(
            'The app is not installed. Please install the app and try again.');
      case 'captcha-check-failed':
        return const FirebaseAuthenticationException(
            'The security check failed. Please try again.');
      case 'code-expired':
        return const FirebaseAuthenticationException(
            'The code has expired. Please request a new one.');
      case 'cordova-not-ready':
        return const FirebaseAuthenticationException(
            'Cordova is not ready. Please try again later.');
      case 'email-already-in-use':
        return const FirebaseAuthenticationException(
            'This email address is already in use. Please use a different one or sign in.');
      case 'invalid-credential':
        return const FirebaseAuthenticationException(
            'The login credentials are not valid. Please double-check and try again.');
      case 'invalid-email':
        return const FirebaseAuthenticationException(
            'The email address is not valid. Please double-check and try again.');
      case 'invalid-password':
        return const FirebaseAuthenticationException(
            'The password is not valid. Please double-check and try again.');
      case 'invalid-phone-number':
        return const FirebaseAuthenticationException(
            'The phone number is not valid. Please double-check and try again.');
      case 'operation-not-allowed':
        return const FirebaseAuthenticationException(
            'The requested operation is not allowed.');
      case 'user-not-found':
        return const FirebaseAuthenticationException(
            'User not found. Please check your information and try again.');
      case 'user-disabled':
        return const FirebaseAuthenticationException(
            'This account has been disabled. Please contact support for assistance.');
      case 'user-mismatch':
        return const FirebaseAuthenticationException(
            'User mismatch. Please check your information and try again.');
      case 'weak-password':
        return const FirebaseAuthenticationException(
            'The password is too weak. Please choose a stronger password.');
      case 'too-many-requests':
        return const FirebaseAuthenticationException(
            'Too many requests. Please try again later.');
      case 'unverified-email':
        return const FirebaseAuthenticationException(
            'Email not verified. Please verify your email.');
      case 'user-cancelled':
        return const FirebaseAuthenticationException(
            'The operation was cancelled by the user.');
      default:
        return const FirebaseAuthenticationException();
    }
  }
}
