import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Layout/Style/Themeapp.dart';
import '../../../Services/SharedPreferences/Data_Users.dart';
import '../../../Layout/Widget/SingleChildScrollStyles.dart';
import '../../PageMainapp/BottomNavigationBar/BottomNavigationBar.dart';
import '../../Utilities/Components/Language/UserLanguages.dart';
import '../Register/Register_View.dart';
import '../../../Layout/Widget/ButtonStyles.dart';
import '../../../Layout/Widget/DialogStyles.dart';
import '../../../Layout/Widget/PasswordFormFieldStyles.dart';
import '../../../Layout/Widget/TextFormFieldStyles.dart';
import '../../../Layout/Widget/TextStyles.dart';
import '../../../Layout/Style/Styleapp.dart';
import 'package:get/get.dart';

import '../../PageAuthentification/Login/Login_Controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final bool _obscureText = true;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final LoginController _loginController = LoginController();

  List<Map<String, String>>? idPageText;

  Future<void> loadPageText() async {
    Map<String, List<Map<String, String>>> pageTextMap = await LanguageSelected.getIdPageText();
    setState(() {
      idPageText = pageTextMap['loginPageText'] ?? [];
    });
  }

  @override
  void initState() {
    super.initState();
    loadPageText();
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          for (final teks in idPageText ?? []) {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return RegularDialog(
                  header: teks['HeaderWarning1'],
                  description: teks['DescriptionWarning1'],
                  declinedText: teks['DeclineButton1'],
                  loadingDeclinedText: teks['LoadingDeclineButton1'],
                  declinedOnTap: () async {
                    Navigator.of(context).pop();
                    return true;
                  },
                  acceptedText: teks['AcceptedButton1'],
                  loadingAcceptedText: teks['LoadingAcceptedButton1'],
                  acceptedOnTap: () async {
                    _performExitAction();
                    return true;
                  },
                );
              },
            );
          }
        },
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: _loginController.imagePath.isNotEmpty
                      ? Opacity(
                    opacity: 0.3,
                    // child: Image.asset(
                    //   _loginController.imagePath,
                    //   width: double.infinity,
                    //   height: double.infinity,
                    //   fit: BoxFit.cover,
                    // ),
                  )
                      : Container(),
                ),
              ),
              Column(
                children: [
                  for (final teks in idPageText ?? [])
                    Expanded(
                        child: AnimateFadeVerticalScrollView(
                          xStart: -30.0,
                          xEnd: 0.0,
                          child: Column(
                            children: [
                              const SizedBox(height: 10,),
                              Align(
                                alignment: Alignment.topLeft,
                                child: GradientText(
                                  text: teks["Header"],
                                  gradientColors: const [Colors.lightGreenAccent, Colors.green],
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  teks['SubHeader'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  style: StyleApp.mediumTextStyle.copyWith(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32,),
                              Align(
                                  alignment: Alignment.center,
                                  child: AnimateTextField(
                                    controller: _loginController.usernameController,
                                    keyboardType: TextInputType.emailAddress,
                                    labelText: teks['Email'],
                                    icon: const Icon(Icons.mail),
                                    containerColor: themeColors.textFieldColor,
                                    containerRadius: 32,
                                    borderAnimationColor: Colors.green,
                                    borderAnimationRadius: 32,
                                  )
                              ),

                              // Kondisi visibilitas teks peringatan Username
                              WarningText(
                                  visible: _loginController.kondisiUsernameKosong,
                                  text: 'Username tidak boleh kosong'
                              ),
                              WarningText(
                                  visible: _loginController.kondisiUsernameKurang4,
                                  text: 'Panjang Username/No WhatsApp kurang dari 4 karakter'
                              ),
                              const SizedBox(height: 20,),
                              Align(
                                  alignment: Alignment.center,
                                  child: AnimatePasswordField(
                                    controller: _loginController.passwordController,
                                    obscureText: _obscureText,
                                    labelText: teks['Password'],
                                    icon: const Icon(Icons.lock),
                                    containerColor: themeColors.textFieldColor,
                                    containerRadius: 32,
                                    borderAnimationColor: Colors.green,
                                    borderAnimationRadius: 32,
                                  )
                              ),

                              // Kondisi visibilitas teks peringatan Password
                              WarningText(
                                  visible: _loginController.kondisiPasswordKosong,
                                  text: 'Password tidak boleh kosong'
                              ),
                              WarningText(
                                  visible: _loginController.kondisiPasswordKurang6,
                                  text: 'Panjang Password kurang dari 6 karakter'
                              ),
                              const SizedBox(height: 12,),
                              // Row(
                              //   children: [
                              //     // Align(
                              //     //   alignment: Alignment.topLeft,
                              //     //   child: GestureDetector(
                              //     //     onTap: (){
                              //     //       // Get.to(const InfoAccountPage());
                              //     //     },
                              //     //     child: const Text('Info Akun (Debug Mode)'),
                              //     //   ),
                              //     // ),
                              //     // Expanded(
                              //     //   child: Align(
                              //     //     alignment: Alignment.topRight,
                              //     //     child: Text(
                              //     //       teks['ForgotPass'],
                              //     //       overflow: TextOverflow.ellipsis,
                              //     //       maxLines: 1,
                              //     //       style: StyleApp.mediumTextStyle.copyWith(
                              //     //           color: themeColors.warningColor,
                              //     //           fontStyle: FontStyle.italic,
                              //     //           fontWeight: FontWeight.bold
                              //     //       ),
                              //     //     ),
                              //     //   ),
                              //     // ),
                              //   ],
                              // ),
                              const SizedBox(height: 30),
                              AnimateProgressButton(
                                labelButton: teks['ButtonLogin'],
                                labelProgress: teks['LoadingButtonLogin'],
                                icon: const Icon(Icons.dashboard),
                                height: 50,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                containerColor: Colors.lightGreen.shade700,
                                containerRadius: 100,
                                onTap: () async {
                                  if (_loginController.validateInputs(context) != null) {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                  }
                                  return true;
                                },
                              ),
                              AnimateProgressButton(
                                labelButton: teks['ButtonRegister'],
                                labelProgress: teks['LoadingButtonRegister'],
                                icon: const Icon(Icons.list_alt_rounded),
                                height: 50,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                containerColor: Colors.blue.shade800,
                                containerRadius: 100,
                                onTap: () async {
                                  Get.off(() => const Register(), transition: Transition.circularReveal, duration: const Duration(seconds: 1));
                                  return true;
                                },
                              ),
                              const SizedBox(height: 30),
                              LineText(
                                text: teks["SeparationText"],
                                lineOpacity: 0.5,
                              ),
                              const SizedBox(height: 30),
                              AnimateFlagButton(
                                labelButton: teks['ButtonGuest'],
                                labelProgress: teks['LoadingButtonGuest'],
                                image: Image.asset('assets/Icon/google.png', width: 24,),
                                height: 50,
                                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                                borderColor: Colors.red.shade800,
                                containerRadius: 100,
                                onTap: () async {
                                  if (_loginController.isLoadingLoginWithGoogle) {
                                    return true;
                                  }
                                  UserCredential? userCredential = await _loginController.validateGoogleSignIn(context);
                                  _loginController.isLoadingLoginWithGoogle = false;
                                  return true;
                                },
                              ),
                            ],
                          ),
                        )
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _performExitAction() {
    SystemNavigator.pop();
  }
}