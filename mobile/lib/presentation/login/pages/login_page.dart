import 'package:flutter/material.dart';
import 'package:mobile/presentation/shared/my_button.dart';
import 'package:mobile/presentation/shared/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? isEmailText;
  String? isPasswordText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to TeamBey',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              'Sign in',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 35,
                  ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.g_mobiledata),
                        Text('Sign in with Google')
                      ],
                    )),
                ElevatedButton(onPressed: () {}, child: Text('F')),
                ElevatedButton(onPressed: () {}, child: Text('A')),
              ],
            ),
            const SizedBox(height: 50),
            MyTextField(
              label: 'Enter you email address',
              hintText: 'user@example.com',
              controller: _emailController,
              errorText: isEmailText,
            ),
            const SizedBox(height: 30),
            MyTextField(
              label: 'Enter you password',
              hintText: '*********',
              isPassword: true,
              controller: _passwordController,
              errorText: isPasswordText,
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
              child: 'Sign in ',
              ontap: () {
                final emailFormat =
                    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                bool isMatch =
                    emailFormat.hasMatch(_emailController.text.trim());

                if (isMatch) {
                  // bech naamel request mte3i
                } else {
                  // mehy valid
                  setState(() {
                    isEmailText = 'Email format non valid';
                  });
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('No Account ? '),
                TextButton(onPressed: () {}, child: const Text('Sign up'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
