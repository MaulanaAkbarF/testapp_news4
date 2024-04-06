import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Layout/Style/Styleapp.dart';
import '../../../Layout/Style/Themeapp.dart';
import '../../../Layout/Widget/ButtonStyles.dart';
import '../../../Layout/Widget/DialogStyles.dart';
import '../../../Layout/Widget/PasswordFormFieldStyles.dart';
import '../../../Layout/Widget/SingleChildScrollStyles.dart';
import '../../../Layout/Widget/TextFormFieldStyles.dart';
import '../../../Layout/Widget/TextStyles.dart';
import '../../Utilities/Components/Language/UserLanguages.dart';
import '../Login/Login_View.dart';
import 'Register_Controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  RegisterController _registerController = RegisterController();

  List<Map<String, String>>? idPageText;

  Future<void> loadPageText() async {
    Map<String, List<Map<String, String>>> pageTextMap = await LanguageSelected.getIdPageText();
    setState(() {
      idPageText = pageTextMap['registerPageText'];
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
                    Get.off(() => const Login(), transition: Transition.fade, duration: const Duration(seconds: 1));
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
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: _registerController.imagePath.isNotEmpty
                      ? Opacity(
                    opacity: 0.3,
                    // child: Image.asset(
                    //   _registerController.imagePath,
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
                                alignment: FractionalOffset.topLeft,
                                child: GradientText(
                                  text: idPageText?[0]['Header'] ?? 'No Text',
                                  gradientColors: [Colors.lightBlueAccent, Colors.blue.shade700],
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Align(
                                alignment: FractionalOffset.topLeft,
                                child: Text(idPageText?[0]['SubHeader'] ?? 'No Text',
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
                                  alignment: FractionalOffset.center,
                                  child: AnimateTextField(
                                    controller: _registerController.nameController,
                                    labelText: idPageText?[0]['Name'] ?? 'No Text',
                                    icon: const Icon(Icons.person),
                                    containerColor: themeColors.textFieldColor,
                                    containerRadius: 32,
                                    borderAnimationColor: Colors.blue,
                                    borderAnimationRadius: 32,
                                  )
                              ),
                              WarningText(
                                  visible: _registerController.kondisiNamaKosong,
                                  text: idPageText?[0]['NameWarning1'] ?? 'No Text'
                              ),
                              WarningText(
                                  visible: _registerController.kondisiNamaKurang4,
                                  text: idPageText?[0]['NameWarning2'] ?? 'No Text'
                              ),
                              const SizedBox(height: 20,),
                              Align(
                                  alignment: FractionalOffset.center,
                                  child: AnimateTextField(
                                    controller: _registerController.usernameController,
                                    labelText: idPageText?[0]['Email'] ?? 'No Text',
                                    icon: const Icon(Icons.mail),
                                    containerColor: themeColors.textFieldColor,
                                    containerRadius: 32,
                                    borderAnimationColor: Colors.blue,
                                    borderAnimationRadius: 32,
                                  )
                              ),
                              WarningText(
                                  visible: _registerController.kondisiUsernameKosong,
                                  text: idPageText?[0]['EmailWarning1'] ?? 'No Text'
                              ),
                              WarningText(
                                  visible: _registerController.kondisiUsernameKurang4,
                                  text: idPageText?[0]['EmailWarning2'] ?? 'No Text'
                              ),
                              const SizedBox(height: 20,),
                              Align(
                                  alignment: FractionalOffset.center,
                                  child: AnimatePasswordField(
                                    controller: _registerController.passwordController,
                                    obscureText: _obscureText,
                                    labelText: idPageText?[0]['Password'] ?? 'No Text',
                                    icon: const Icon(Icons.lock),
                                    containerColor: themeColors.textFieldColor,
                                    containerRadius: 32,
                                    borderAnimationColor: Colors.blue,
                                    borderAnimationRadius: 32,
                                  )
                              ),

                              // Kondisi visibilitas teks peringatan Password
                              WarningText(
                                  visible: _registerController.kondisiPasswordKosong,
                                  text: idPageText?[0]['PasswordWarning1'] ?? 'No Text'
                              ),
                              WarningText(
                                  visible: _registerController.kondisiPasswordKurang6,
                                  text: idPageText?[0]['PasswordWarning2'] ?? 'No Text'
                              ),
                              const SizedBox(height: 20,),
                              Align(
                                  alignment: FractionalOffset.center,
                                  child: AnimatePasswordField(
                                    controller: _registerController.passwordConfirmController,
                                    obscureText: _obscureText,
                                    labelText: idPageText?[0]['PasswordConfirm'] ?? 'No Text',
                                    icon: const Icon(Icons.lock_clock_rounded),
                                    containerColor: themeColors.textFieldColor,
                                    containerRadius: 32,
                                    borderAnimationColor: Colors.blue,
                                    borderAnimationRadius: 32,
                                  )
                              ),

                              // Kondisi visibilitas teks peringatan Password
                              WarningText(
                                  visible: _registerController.kondisiPasswordConfirmKosong,
                                  text: idPageText?[0]['PasswordWarning1'] ?? 'No Text'
                              ),
                              WarningText(
                                  visible: _registerController.kondisiPasswordConfirmKurang6,
                                  text: idPageText?[0]['PasswordWarning2'] ?? 'No Text'
                              ),
                              WarningText(
                                  visible: _registerController.kondisiPasswordConfirmTidakSama,
                                  text: idPageText?[0]['PasswordConfirmWarning3'] ?? 'No Text'
                              ),
                              const SizedBox(height: 20,),
                              AnimateProgressButton(
                                labelButton: idPageText?[0]['ButtonRegister'] ?? 'No Text',
                                labelProgress: idPageText?[0]['LoadingButtonRegister'] ?? 'No Text',
                                icon: const Icon(Icons.playlist_add_sharp),
                                height: 50,
                                margin: const EdgeInsets.symmetric(vertical: 40),
                                containerColor: Colors.lightBlueAccent,
                                containerRadius: 100,
                                onTap: () {
                                  if (_registerController.validateInputs(context) != null) {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                  }
                                  return true;
                                },
                              ),
                              LineText(
                                text: idPageText?[0]['SeparationText'] ?? 'No Text',
                                lineOpacity: 0.5,
                              ),
                              const SizedBox(height: 20),
                              AnimateProgressButton(
                                labelButton: idPageText?[0]['ButtonLogin'] ?? 'No Text',
                                labelProgress: idPageText?[0]['LoadingButtonLogin'] ?? 'No Text',
                                icon: const Icon(Icons.dashboard),
                                height: 50,
                                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 80),
                                containerColor: Colors.blue.shade800,
                                containerRadius: 100,
                                onTap: () async {
                                  Get.to(() => const Login(), transition: Transition.circularReveal, duration: const Duration(seconds: 1));
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
}