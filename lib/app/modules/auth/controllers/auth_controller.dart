import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'firebase_auth_exceptions.dart';

import '../../../localization/hardcoded.dart';
import '../../../constants/text_strings.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/spc_utils.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  final auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  final verificationId = ''.obs;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  void _setInitialScreen(User? user) {
    user == null
        ? Get.offAllNamed(Routes.LANDING)
        : (user.email != null || user.email != '') && !user.emailVerified
            ? Get.offAllNamed(Routes.HOME)
            : Get.offAllNamed(Routes.LANDING);
  }

  Future<void> phoneAuth(String phoneNumber) async {
    phoneNumber = SPCUtils.phoneFormatter(phoneNumber);
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      codeSent: (String verificationId, int? resendToken) async {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (FirebaseAuthException e) {
        final ex = FirebaseAuthenticationException.fromFirebaseException(e);
        Get.snackbar(SPCTextString.errorResponse, ex.message,
            snackPosition: SnackPosition.BOTTOM);
        if (kDebugMode) {
          print('${SPCTextString.firebaseAuthException}: ${ex.message}'
              .toUpperCase());
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    UserCredential credentials = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  void registerUser(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAllNamed(Routes.HOME)
          : Get.offAllNamed(Routes.LANDING);
    } on FirebaseAuthException catch (e) {
      final ex = FirebaseAuthenticationException.fromFirebaseException(e);
      Get.snackbar(SPCTextString.errorResponse, ex.message,
          snackPosition: SnackPosition.BOTTOM);
      if (kDebugMode) {
        print('${SPCTextString.firebaseAuthException}: ${ex.message}'
            .toUpperCase());
      }
    } catch (_) {}
  }

  Future<void> signInUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = FirebaseAuthenticationException.fromFirebaseException(e);
      Get.snackbar(SPCTextString.errorResponse, ex.message,
          snackPosition: SnackPosition.BOTTOM);
      if (kDebugMode) {
        print('${SPCTextString.firebaseAuthException}: ${ex.message}'
            .toUpperCase());
      }
    } catch (_) {}
  }

  Future<void> signOutUser() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      final ex = FirebaseAuthenticationException.fromFirebaseException(e);
      Get.snackbar(SPCTextString.errorResponse, ex.message,
          snackPosition: SnackPosition.BOTTOM);
      if (kDebugMode) {
        print('${SPCTextString.firebaseAuthException}: ${ex.message}'
            .toUpperCase());
      }
    } catch (_) {}
  }

  Future<void> linkEmail(String email, String password) async {
    try {
      final credential =
          EmailAuthProvider.credential(email: email, password: password);
      final userCredential =
          await auth.currentUser?.linkWithCredential(credential);
      if (userCredential != null) {
        Get.snackbar(SPCTextString.successResponse,
            'Email successfully linked to your account'.hardcoded,
            snackPosition: SnackPosition.BOTTOM);
        await verifyEmail();
        await signOutUser();
      }
    } on FirebaseAuthException catch (e) {
      final ex = FirebaseAuthenticationException.fromFirebaseException(e);
      Get.snackbar(SPCTextString.errorResponse, ex.message,
          snackPosition: SnackPosition.BOTTOM);
      if (kDebugMode) {
        print('${SPCTextString.firebaseAuthException}: ${ex.message}'
            .toUpperCase());
      }
    } catch (_) {}
  }

  Future<void> unlinkEmail() async {
    try {
      await auth.currentUser?.unlink('password'.hardcoded);
      Get.snackbar(SPCTextString.successResponse,
          'Email successfully unlinked from your account'.hardcoded,
          snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      final ex = FirebaseAuthenticationException.fromFirebaseException(e);
      Get.snackbar(SPCTextString.errorResponse, ex.message,
          snackPosition: SnackPosition.BOTTOM);
      if (kDebugMode) {
        print('${SPCTextString.firebaseAuthException}: ${ex.message}'
            .toUpperCase());
      }
    } catch (_) {}
  }

  Future<void> verifyEmail() async {
    try {
      await auth.currentUser?.sendEmailVerification();
      Get.snackbar(SPCTextString.successResponse,
          'Email verification link sent to your email'.hardcoded,
          snackPosition: SnackPosition.BOTTOM);
    } on FirebaseAuthException catch (e) {
      final ex = FirebaseAuthenticationException.fromFirebaseException(e);
      Get.snackbar(SPCTextString.errorResponse, ex.message,
          snackPosition: SnackPosition.BOTTOM);
      if (kDebugMode) {
        print('${SPCTextString.firebaseAuthException}: ${ex.message}'
            .toUpperCase());
      }
    } catch (_) {}
  }

  Future<void> signInMustVerify(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      if (auth.currentUser?.emailVerified == true) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar(SPCTextString.errorResponse,
            'Please verify your email to continue'.hardcoded,
            snackPosition: SnackPosition.BOTTOM);
        await verifyEmail();
        await signOutUser();
      }
    } on FirebaseAuthException catch (e) {
      final ex = FirebaseAuthenticationException.fromFirebaseException(e);
      Get.snackbar(SPCTextString.errorResponse, ex.message,
          snackPosition: SnackPosition.BOTTOM);
      if (kDebugMode) {
        print('${SPCTextString.firebaseAuthException}: ${ex.message}'
            .toUpperCase());
      }
    } catch (_) {}
  }

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar(SPCTextString.successResponse,
          'Password reset link sent to your email'.hardcoded,
          snackPosition: SnackPosition.BOTTOM);
    } on FirebaseAuthException catch (e) {
      final ex = FirebaseAuthenticationException.fromFirebaseException(e);
      Get.snackbar(SPCTextString.errorResponse, ex.message,
          snackPosition: SnackPosition.BOTTOM);
      if (kDebugMode) {
        print('${SPCTextString.firebaseAuthException}: ${ex.message}'
            .toUpperCase());
      }
    } catch (_) {}
  }
}
