import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Services/BackendIntegration/FirebaseAuth/Auth_Service.dart';
import '../Login/Login_View.dart';

class RegisterController {
  String imagePath = 'assets/Image/bgLogin2.png';
  bool kondisiNamaKosong = false;
  bool kondisiNamaKurang4 = false;
  bool kondisiUsernameKosong = false;
  bool kondisiUsernameKurang4 = false;
  bool kondisiPasswordKosong = false;
  bool kondisiPasswordKurang6 = false;
  bool kondisiPasswordConfirmKosong = false;
  bool kondisiPasswordConfirmKurang6 = false;
  bool kondisiPasswordConfirmTidakSama = false;

  final RegisterService _registerService = RegisterService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  Future<void> validateInputs(BuildContext context) async {
    kondisiNamaKosong = false;
    kondisiNamaKurang4 = false;
    kondisiUsernameKosong = false;
    kondisiUsernameKurang4 = false;
    kondisiPasswordKosong = false;
    kondisiPasswordKurang6 = false;
    kondisiPasswordConfirmKosong = false;
    kondisiPasswordConfirmKurang6 = false;
    kondisiPasswordConfirmTidakSama = false;

    if (nameController.text.isEmpty) {
      kondisiNamaKosong = true;
    } else if (nameController.text.length < 4) {
      kondisiNamaKurang4 = true;
    } else if (usernameController.text.isEmpty) {
      kondisiUsernameKosong = true;
    } else if (usernameController.text.length < 4) {
      kondisiUsernameKurang4 = true;
    } else if (passwordController.text.isEmpty) {
      kondisiPasswordKosong = true;
    } else if (passwordController.text.length < 6) {
      kondisiPasswordKurang6 = true;
    } else if (passwordConfirmController.text.isEmpty) {
      kondisiPasswordConfirmKosong = true;
    } else if (passwordConfirmController.text.length < 6) {
      kondisiPasswordConfirmKurang6 = true;
    } else if (passwordConfirmController.text != passwordController.text) {
      kondisiPasswordConfirmTidakSama = true;
    } else {
      UserCredential? userCredential = await _registerService.registerWithEmailAndPassword(
        usernameController.text,
        passwordController.text,
      );

      if (userCredential != null) {
        await moveToLoginPage();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Registrasi Gagal!\nPastikan email dan password sesuai'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  // Menuju ke halaman selanjutnya
  Future<void> moveToLoginPage() async {
    return Get.off(() => Login(), transition: Transition.topLevel, duration: const Duration(milliseconds: 2500));
  }
}