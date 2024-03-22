import 'package:flutter/material.dart';
import 'package:mobile/presentation/shared/my_text_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required TextEditingController emailController,
    required this.emailErrorText,
    required TextEditingController usernameController,
    required this.usernameErrorText,
    required TextEditingController contactNumberController,
    required this.contactErrorText,
    required TextEditingController passwordController,
    required this.passwordErrorText,
  })  : _emailController = emailController,
        _usernameController = usernameController,
        _contactNumberController = contactNumberController,
        _passwordController = passwordController;

  final TextEditingController _emailController;
  final String? emailErrorText;
  final TextEditingController _usernameController;
  final String? usernameErrorText;
  final TextEditingController _contactNumberController;
  final String? contactErrorText;
  final TextEditingController _passwordController;
  final String? passwordErrorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyTextField(
          label: 'Enter you email address',
          hintText: 'user@example.com',
          controller: _emailController,
          errorText: emailErrorText,
        ),
        Row(
          children: [
            Expanded(
              child: MyTextField(
                  label: 'enter your username',
                  hintText: 'username',
                  controller: _usernameController,
                  errorText: usernameErrorText),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: MyTextField(
                    label: 'enter your contact number',
                    hintText: 'contact number',
                    controller: _contactNumberController,
                    errorText: contactErrorText))
          ],
        ),
        MyTextField(
          label: 'Enter you password',
          hintText: '*********',
          isPassword: true,
          controller: _passwordController,
          errorText: passwordErrorText,
        ),
      ],
    );
  }
}
