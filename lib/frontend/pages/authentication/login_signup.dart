import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knustforum/backend/authentication/user_auth.dart';
import 'package:knustforum/frontend/widgets/app_button.dart';
import 'package:knustforum/frontend/widgets/big_text.dart';
import 'package:knustforum/frontend/widgets/custom_vertical_divider.dart';
import 'package:knustforum/frontend/widgets/small_text.dart';

import '../../widgets/text_form_field.dart';

class LoginAndSignUp extends StatefulWidget {
  const LoginAndSignUp({Key? key}) : super(key: key);

  @override
  State<LoginAndSignUp> createState() => _LoginAndSignUpState();
}

class _LoginAndSignUpState extends State<LoginAndSignUp> {
  bool isLoadingRegister = false;
  bool isLoadingLogin = false;
  bool loginFailed = false;
  bool registerFailed = false;
  dynamic result;
  final registerFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController emailLoginController = TextEditingController();
    TextEditingController passwordLoginController = TextEditingController();
    TextEditingController emailRegisterController = TextEditingController();
    TextEditingController passwordRegisterController = TextEditingController();
    TextEditingController usernameRegisterController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 100),
        child: SingleChildScrollView(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Form(
                  key: registerFormKey,
                  child: Column(
                    children: <Widget>[
                      const BigText(text: 'REGISTER'),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextField(
                        icon: Icons.perm_identity_rounded,
                        iconColor: Colors.green,
                        // check if the text field is not empty
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                        fieldController: usernameRegisterController,
                        fieldLabelText: 'username',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        icon: Icons.email_rounded,
                        iconColor: Colors.green,
                        // check if the text field is not empty
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                        fieldController: emailRegisterController,
                        fieldLabelText: 'email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        icon: Icons.password_rounded,
                        iconColor: Colors.green,
                        // check if the text field is not empty
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                        fieldController: passwordRegisterController,
                        fieldLabelText: 'password',
                        obscure: true,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AppButton(
                        onPressed: () async {
                          if (registerFormKey.currentState!.validate()) {
                            setState(() {
                              isLoadingRegister = true;
                            });
                            result = await AuthService()
                                .registerWithEmailAndPassword(
                              emailRegisterController.text,
                              passwordRegisterController.text,
                              usernameRegisterController.text,
                            );
                            if (result == null) {
                              setState(() {
                                isLoadingRegister = false;
                                registerFailed = true;
                              });
                            } else {
                              setState(() {
                                isLoadingRegister = false;
                              });
                              context.go('/home');
                            }
                          }
                        },
                        borderColor: Colors.green,
                        buttonLabelText: 'REGISTER',
                        textSize: 20,
                        buttonHeight: 80,
                        buttonRadius: 50,
                        textColor: Colors.green,
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      isLoadingRegister
                          ? const Row(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 200,
                                  child: Center(
                                    child: AppSmallText(
                                      text: 'Registering ...',
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                CircularProgressIndicator(
                                  color: Colors.green,
                                ),
                              ],
                            )
                          : Container(),
                      registerFailed && !registerFailed
                          ? const SizedBox(
                              height: 50,
                              width: 200,
                              child: Center(
                                child: AppSmallText(
                                  text: 'Failed to register',
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 100,
              ),
              const CustomVerticalDivider(
                height: 600,
              ),
              const SizedBox(
                width: 100,
              ),
              Flexible(
                flex: 1,
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    children: [
                      const BigText(text: 'LOGIN'),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextField(
                        icon: Icons.email_rounded,
                        iconColor: Colors.green,
                        // check if the text field is not empty
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                        fieldController: emailLoginController,
                        fieldLabelText: 'email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        icon: Icons.password_rounded,
                        iconColor: Colors.green,
                        // check if the text field is not empty
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                        fieldController: passwordLoginController,
                        fieldLabelText: 'password',
                        obscure: true,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AppButton(
                        onPressed: () async {
                          if (loginFormKey.currentState!.validate()) {
                            setState(() {
                              isLoadingLogin = true;
                            });
                            result =
                                await AuthService().loginWithEmailAndPassword(
                              emailLoginController.text,
                              passwordLoginController.text,
                            );
                            if (result == null) {
                              setState(() {
                                isLoadingLogin = false;
                                loginFailed = true;
                              });
                            } else {
                              setState(() {
                                isLoadingLogin = false;
                              });
                              context.go('/home');
                            }
                          }
                        },
                        borderColor: Colors.green,
                        buttonLabelText: 'LOGIN',
                        textSize: 20,
                        buttonHeight: 80,
                        buttonRadius: 50,
                        textColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      isLoadingLogin
                          ? const Row(
                              children: [
                                Center(
                                  child: SizedBox(
                                    height: 100,
                                    width: 200,
                                    child: AppSmallText(
                                      text: 'Logging in ...',
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                CircularProgressIndicator(
                                  color: Colors.green,
                                ),
                              ],
                            )
                          : Container(),
                      loginFailed && !isLoadingLogin
                          ? const SizedBox(
                              height: 100,
                              width: 400,
                              child: Center(
                                child: AppSmallText(
                                  text: 'Failed to login',
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
