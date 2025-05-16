import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants/textStyles.dart';
import '../../controller/authController.dart';
import '../../service/localization.dart';
import '../../utils/themes.dart';
import '../../widgets/customElevatedButton.dart';
import 'loginPage.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
        backgroundColor: AppTheme.getThemeExtension(context).primaryBGColor!,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 80.0),
                      Text(
                        localizations.translate("forgotPasswordTitle"),
                        style: AppTextStyles.bigTitleStyle(context),
                      ),
                      const SizedBox(height: 90.0),
                      SizedBox(
                        height: 56,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFF7F8F9),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
                            ),
                            labelText: localizations.translate("email"),
                            labelStyle: AppTextStyles.bodySmallStyle(context),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      CustomElevatedButton(
                        label: localizations.translate("sendResetLink"),
                        onPressed: () async {
                          // await AuthController.onForgotPasswordPressed(
                          //   emailController.text,
                          //   context,
                          // );
                        },
                      ),
                      const SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: localizations.translate("alreadyHaveAccount"),
                    style: AppTextStyles.bodySmallStyle(context),
                    children: <TextSpan>[
                      TextSpan(
                        text: localizations.translate("loginNow"),
                        style: AppTextStyles.bodySmallLinkStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}