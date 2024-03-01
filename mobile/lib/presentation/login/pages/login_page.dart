import 'package:flutter/material.dart';
import 'package:mobile/presentation/shared/my_button.dart';
import 'package:mobile/presentation/shared/my_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

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
            Container(
              color: Colors.green,
              child: Row(
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
            ),
            const SizedBox(height: 50),
            const MyTextField(
              label: 'Enter you email address',
              hintText: 'user@example.com',
            ),
            const SizedBox(height: 30),
            const MyTextField(
              label: 'Enter you password',
              hintText: '*********',
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
                // traitment 1
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
