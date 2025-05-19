import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/textStyles.dart';
import '../../controller/authController.dart';
import '../../service/localization.dart';
import '../../utils/themes.dart';
import '../../widgets/customElevatedButton.dart';
import 'forgotPasswordPage.dart';
import 'registerPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  bool _obscure = true;
  late TabController _tabController;
  String selectedRole = Constants.patientRole;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                        localizations.translate("welcomeBack"),
                        style: AppTextStyles.bigTitleStyle(context),
                      ),
                      const SizedBox(height: 50.0),
                      TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // const Icon(Icons.person),
                                Image(
                                  image: AssetImage(LocalAssets.userIcon),
                                  width: 18, // Optional: adjust size
                                  height: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(localizations.translate("users")),
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(LocalAssets.doctorIcon),
                                  width: 20, // Optional: adjust size
                                  height: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(localizations.translate("doctors")),
                              ],
                            ),
                          )
                          // Tab(icon: const Icon(Icons.person),text: localizations.translate("users")),
                          // Tab(icon: const Icon(Icons.medical_services),text: localizations.translate("doctors")),
                        ],
                        isScrollable: false,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: AppTheme.getThemeExtension(context).primaryColor!,
                        labelColor: AppTheme.getThemeExtension(context).primaryLightColor!,
                        unselectedLabelColor: AppTheme.getThemeExtension(context).secondaryAltColor!,
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                        onTap: (index) {
                          setState(() {
                            switch (index) {
                              case 0:
                                selectedRole = Constants.patientRole;
                                break;
                              case 1:
                                selectedRole = Constants.doctorRole;
                                break;
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        height: 56,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: false,
                            //fillColor: const Color(0xFFF7F8F9),
                            border: const OutlineInputBorder(
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
                          obscureText: _obscure,
                          controller: passwordController,
                          decoration: InputDecoration(
                            filled: false,
                            // fillColor: const Color(0xFFF7F8F9),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE8ECF4)),
                            ),
                            labelText: localizations.translate("password"),
                            labelStyle: AppTextStyles.bodySmallStyle(context),
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscure = !_obscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: Text(
                            localizations.translate("forgotPassword"),
                            style: AppTextStyles.bodySmallStyle(context),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      CustomElevatedButton(
                        label: localizations.translate("login"),
                        onPressed: () async {
                          await AuthController.onLoginPressed(
                              emailController.text,
                              passwordController.text,
                              context,
                              selectedRole
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
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              localizations.translate("orLoginWith"),
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
                padding: const EdgeInsets.only(bottom: 40.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: localizations.translate("dontHaveAccount"),
                    style: AppTextStyles.bodySmallStyle(context),
                    children: <TextSpan>[
                      TextSpan(
                        text: localizations.translate("registerNow"),
                        style: AppTextStyles.bodySmallLinkStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}