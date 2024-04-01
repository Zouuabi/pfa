import 'package:flutter/material.dart';
import 'package:mobile/presentation/shared/my_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required TextEditingController emailController,
    required this.isEmailText,
    required TextEditingController passwordController,
    required this.isPasswordText,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final String? isEmailText;
  final String? isPasswordText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
