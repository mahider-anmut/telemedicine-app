import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../../constants/textStyles.dart';
import '../../controller/authController.dart';
import '../../service/localization.dart';
import '../../utils/themes.dart';
import '../../widgets/customElevatedButton.dart';
import 'loginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscure = true;
  bool _obscureConfirm = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastnameController.dispose();
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
                      const SizedBox(height: 40.0),
                      Text(
                        localizations.translate("helloLetsGetStarted"),
                        style: AppTextStyles.bigTitleStyle(context),
                      ),
                      const SizedBox(height: 30.0),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        height: 56,
                        child: TextField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF7F8F9),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE8ECF4)),
                            ),
                            labelText: localizations.translate("firstName"),
                            labelStyle: AppTextStyles.bodySmallStyle(context),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        height: 56,
                        child: TextField(
                          controller: lastnameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF7F8F9),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE8ECF4)),
                            ),
                            labelText: localizations.translate("lastName"),
                            labelStyle: AppTextStyles.bodySmallStyle(context),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        height: 56,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF7F8F9),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE8ECF4)),
                            ),
                            labelText: localizations.translate("email"),
                            labelStyle: AppTextStyles.bodySmallStyle(context),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        height: 56,
                        child: TextField(
                          controller: passwordController,
                          obscureText: _obscure,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFF7F8F9),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE8ECF4)),
                            ),
                            labelText: localizations.translate("password"),
                            labelStyle: AppTextStyles.bodySmallStyle(context),
                            suffixIcon: IconButton(
                              icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                              onPressed: () {
                                setState(() {
                                  _obscure = !_obscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        height: 56,
                        child: TextField(
                          controller: confirmPasswordController,
                          obscureText: _obscureConfirm,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFF7F8F9),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE8ECF4)),
                            ),
                            labelText: localizations.translate("confirmPassword"),
                            labelStyle: AppTextStyles.bodySmallStyle(context),
                            suffixIcon: IconButton(
                              icon: Icon(_obscureConfirm ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirm = !_obscureConfirm;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      CustomElevatedButton(
                        label: localizations.translate("register"),
                        onPressed: () async {
                          await AuthController.onRegisterPressed(
                            firstNameController.text,
                            lastnameController.text,
                            emailController.text,
                            passwordController.text,
                            confirmPasswordController.text,
                            context,
                          );
                        },
                      ),
                      const SizedBox(height: 30.0),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              localizations.translate("orRegisterWith"),
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bodySmallStyle(context),
                            ),
                          ),
                          Expanded(
                            child: Divider(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              // Add your onTap logic here
                            },
                            child: Image.asset(
                              LocalAssets.fbIcon, // Path to your PNG icon
                              width: 100.0, // Adjust width according to your needs
                              height: 50.0, // Adjust height according to your needs
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Add your onTap logic here
                            },
                            child: Image.asset(
                              LocalAssets.googleIcon, // Path to your PNG icon
                              width: 100.0, // Adjust width according to your needs
                              height: 50.0, // Adjust height according to your needs
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Add your onTap logic here
                            },
                            child: Image.asset(
                              LocalAssets.appleIcon, // Path to your PNG icon
                              width: 100.0, // Adjust width according to your needs
                              height: 50.0, // Adjust height according to your needs
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: localizations.translate("alreadyHaveAnAccount"),
                    style: AppTextStyles.bodySmallStyle(context),
                    children: <TextSpan>[
                      TextSpan(
                        text: localizations.translate("loginNow"),
                        style: AppTextStyles.bodySmallLinkStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
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
