import 'package:flutter/material.dart';
import 'package:mobile/core/helper/email_checker.dart';
import 'package:mobile/core/helper/password_checker.dart';
import 'package:mobile/presentation/register/verify/contact_number_checker.dart';
import '../../shared/shared.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _contactNumberController = TextEditingController();
  String? emailErrorText;
  String? passwordErrorText;
  String? usernameErrorText;
  String? contactErrorText;

  // todo : rakah l state management mte3 register
  // todo: me yelzam hatta champ fergh
  // todo : akl fonction mte3 check email

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                'Sign up',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 35,
                    ),
              ),
              const SizedBox(height: 50),
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
              const SizedBox(height: 20),
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
                    Navigator.of(context).pushReplacementNamed('/navigation');
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('have an Account ? '),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Login'))
                ],
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
