import 'package:flutter/material.dart';
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
  String? isEmailText;
  String? isPasswordText;

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
                errorText: isEmailText,
              ),
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                        label: 'enter your username',
                        hintText: 'username',
                        controller: _usernameController,
                        errorText: null),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: MyTextField(
                          label: 'enter your contact number',
                          hintText: 'contact number',
                          controller: _contactNumberController,
                          errorText: null))
                ],
              ),
              MyTextField(
                label: 'Enter you password',
                hintText: '*********',
                isPassword: true,
                controller: _passwordController,
                errorText: isPasswordText,
              ),
              const SizedBox(height: 20),
              MyButton(
                child: 'Sign up',
                ontap: () {
                  final emailFormat = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
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
                  const Text('have an Account ? '),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Sign in'))
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
