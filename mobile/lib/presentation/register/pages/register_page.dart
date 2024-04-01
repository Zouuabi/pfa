import 'package:flutter/material.dart';
import 'package:mobile/core/helper/email_checker.dart';
import 'package:mobile/core/helper/password_checker.dart';
import 'package:mobile/core/helper/contact_number_checker.dart';
import 'package:mobile/presentation/register/widgets/have_account.dart';
import 'package:mobile/presentation/shared/app_welcome.dart';
import '../../shared/shared.dart';

/// todo : barrel file must be added to reduced number of imports
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const SafeArea(child: Scaffold(body: MobileView()));
        } else {
          return const WebView();
        }
      },
    );
  }
}

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _contactNumberController = TextEditingController();
  String? emailErrorText;
  String? passwordErrorText;
  String? usernameErrorText;
  String? contactErrorText;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _contactNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const AppWelcome(child: 'Register'),
            RegisterForm(
              emailController: _emailController,
              emailErrorText: emailErrorText,
              usernameController: _usernameController,
              usernameErrorText: usernameErrorText,
              contactNumberController: _contactNumberController,
              contactErrorText: contactErrorText,
              passwordController: _passwordController,
              passwordErrorText: passwordErrorText,
            ),
            MyButton(
              child: 'Register',
              ontap: () {
                setState(() {
                  emailErrorText = null;
                  passwordErrorText = null;
                  usernameErrorText = null;
                  contactErrorText = null;
                });
                bool isMatch = isEmailValid(email: _emailController.text);
                bool isPasswordMatch =
                    isPasswordValid(password: _passwordController.text);
                bool error = false;

                if (!isMatch) {
                  error = true;
                  setState(() {
                    emailErrorText = 'Email format non valid';
                  });
                }

                if (!isPasswordMatch) {
                  error = true;
                  setState(() {
                    passwordErrorText = 'Password format non valid';
                  });
                }
                if (_usernameController.text.isEmpty) {
                  error = true;
                  setState(() {
                    usernameErrorText = "username";
                  });
                }

                bool isContactMatch =
                    isContactValid(contact: _contactNumberController.text);
                if (!isContactMatch) {
                  error = true;
                  setState(() {
                    contactErrorText = "contact number invalide";
                  });
                }
                if (!error) {
                  Navigator.of(context).pushReplacementNamed('/gender');
                }
              },
            ),
            const HaveAccount()
          ],
        ),
      ),
    );
  }
}

class WebView extends StatelessWidget {
  const WebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.teal,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.sizeOf(context).width * 0.6,
            child: const MobileView(),
          ),
        ],
      ),
    );
  }
}
