import 'package:e_commerce/root_screen.dart';
import 'package:e_commerce/screens/auth/register_screen.dart';
import 'package:e_commerce/widgets/app_name_text.dart';
import 'package:e_commerce/widgets/subtitle_text.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/auth/google_byn.dart';
import 'forget_password.dart';

class LoginScreen extends StatefulWidget {
  static const routeName='/LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passController;

  late final FocusNode _emailFocusNode;
  late final FocusNode _passFocusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();

    _emailFocusNode = FocusNode();
    _passFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      _emailController.dispose();
      _passController.dispose();
      _emailFocusNode.dispose();
      _passFocusNode.dispose();
    }
    super.dispose();
  }

  Future<void> _loginFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const AppNameTextWidget(
                  fontSize: 30,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: TitlesTextWidget(
                    label: 'Welcome back!',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email Address',
                          prefixIcon: Icon(IconlyLight.message),
                        ),
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_passFocusNode);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter an Email';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _passController,
                        focusNode: _passFocusNode,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          hintText: '**********',
                          prefixIcon: Icon(IconlyLight.message),
                        ),
                        onFieldSubmitted: (value) {
                          _loginFct();
                        },
                        validator: (value) {
                          if (value!.length < 6 || value.isEmpty) {
                            return 'Enter a validate password';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                ForgotPasswordScreen.routeName,
                            );
                          },
                          child: const SubtitleTextWidget(
                            label: 'Forget password?',
                            fontStyle: FontStyle.italic,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(12),
                            // backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.login),
                          label: Text(
                            'Login',
                            style: GoogleFonts.aBeeZee(),
                          ),
                          onPressed: () async {
                            await _loginFct();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SubtitleTextWidget(
                          label: 'Or connect using'.toUpperCase()),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: kBottomNavigationBarHeight + 10,
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: kBottomNavigationBarHeight,
                                child: FittedBox
                                  (child: GoogleButton()),
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Expanded(
                              child: SizedBox(
                                height: kBottomNavigationBarHeight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(12),
                                    // backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'Guest? ',
                                    style: GoogleFonts.aBeeZee(),
                                  ),
                                  onPressed: () async {
                                     Navigator.of(context).pushNamed(RootScreen.routeName);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SubtitleTextWidget(label: 'New here?'),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(RegisterScreen.routName);
                            },
                            child: const SubtitleTextWidget(
                              label: 'Sign up',
                              fontStyle: FontStyle.italic,
                              textDecoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
