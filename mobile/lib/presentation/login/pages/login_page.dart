import 'package:flutter/material.dart';

import 'package:mobile/core/helper/email_checker.dart';
import 'package:mobile/presentation/login/widgets/longin_form.dart';
import 'package:mobile/presentation/login/widgets/no_account.dart';
import 'package:mobile/presentation/login/widgets/social_login.dart';
import 'package:mobile/presentation/shared/app_welcome.dart';
import 'package:mobile/presentation/shared/my_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return const Scaffold(body: SafeArea(child: MobileView()));
        } else {
          return const WebView();
        }
      },
    );
  }
}

class MobileView extends StatefulWidget {
  const MobileView({
    super.key,
  });

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? isEmailText;
  String? isPasswordText;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppWelcome(child: 'Login'),
            const SizedBox(height: 50),
            const SocialLogin(),
            const SizedBox(height: 50),
            LoginForm(
              emailController: _emailController,
              isEmailText: isEmailText,
              passwordController: _passwordController,
              isPasswordText: isPasswordText,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Forgot Password ?'),
              ),
            ),
            MyButton(
              child: 'Login',
              ontap: () {
                bool isMatch = isEmailValid(email: _emailController.text);

                if (isMatch) {
                  Navigator.of(context).pushReplacementNamed('/navigation');
                } else {
                  // mehy valid
                  setState(() {
                    isEmailText = 'Email format non valid';
                  });
                }
              },
            ),
            const NoAccount()
          ],
        ),
      ),
    );
  }
}

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 0, 95, 85),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  blurRadius: 7,
                  spreadRadius: 0.5,
                  color: Color.fromARGB(207, 184, 183, 183))
            ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
            width: screen.width * 0.6,
            height: screen.height * 0.9,
            // ! rahi hethy hyela w meyjich hakka
            // ? es3ll chat chpt tw ygolk
            // todo : l todo dima safra
            // hedhi commment aadya
            //*** hedhi comment afta7 chway */
            ////dsfdsfdsfdsfds
            child: const MobileView(),
          )
        ],
      ),
    );
  }
}
