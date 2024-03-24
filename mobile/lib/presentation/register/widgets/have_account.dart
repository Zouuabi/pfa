import 'package:flutter/material.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('have an Account ? '),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Login'))
      ],
    );
  }
}
