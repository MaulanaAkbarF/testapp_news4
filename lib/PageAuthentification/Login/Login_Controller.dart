import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Services/SharedPreferences/Data_Users.dart';
import '../../PageMainapp/BottomNavigationBar/BottomNavigationBar.dart';
import '../../Services/BackendIntegration/FirebaseAuth/Auth_Service.dart';

class LoginController {
  String imagePath = 'assets/Image/bgLogin.png';
  bool kondisiUsernameKosong = false;
  bool kondisiUsernameKurang4 = false;
  bool kondisiPasswordKosong = false;
  bool kondisiPasswordKurang6 = false;
  bool isLoadingLoginWithGoogle = false;

  final authService = SignInService();
  final googleSignInService = GoogleSignInService();
  final DataUsers _dataUsers = DataUsers();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool> validateInputs(BuildContext context) async {
    kondisiUsernameKosong = false;
    kondisiUsernameKurang4 = false;
    kondisiPasswordKosong = false;
    kondisiPasswordKurang6 = false;

    if (usernameController.text.isEmpty) {
      return kondisiUsernameKosong = true;
    } else if (usernameController.text.length < 4) {
      return kondisiUsernameKurang4 = true;
    } else if (passwordController.text.isEmpty) {
      return kondisiPasswordKosong = true;
    } else if (passwordController.text.length < 6) {
      return kondisiPasswordKurang6 = true;
    } else {
      validateEmailSignIn(context);
      return true;
    }
  }

  Future<UserCredential?> validateEmailSignIn(BuildContext context) async {
    UserCredential? userCredential = await authService.signInWithEmailAndPassword(
      usernameController.text,
      passwordController.text,
    );

    if (userCredential != null) {
      await moveToMainPage();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Login Gagal!\nEmail atau password salah'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    return userCredential;
  }

  Future<UserCredential?> validateGoogleSignIn(BuildContext context) async {
    UserCredential? userCredential = await googleSignInService.signInWithGoogle();

    if (userCredential != null) {
      await moveToMainPage();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Login dengan Google Gagal'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    return userCredential;
  }

  Future<void> moveToMainPage() async {
    return Get.off(() => CustomBottomNavigationBar(dataUsers: _dataUsers), transition: Transition.topLevel, duration: const Duration(milliseconds: 2500));
  }
}
