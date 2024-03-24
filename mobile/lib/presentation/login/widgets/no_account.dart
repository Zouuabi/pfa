import 'package:flutter/material.dart';

class NoAccount extends StatelessWidget {
  const NoAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('No Account ? '),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/register');
            },
            child: const Text('Register'))
      ],
    );
  }
}
