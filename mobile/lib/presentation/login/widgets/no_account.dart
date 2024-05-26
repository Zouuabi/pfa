import 'package:flutter/material.dart';
import 'package:mobile/presentation/register/pages/role_page.dart';

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
              Navigator.of(context).pushNamed(RolePage.route);
            },
            child: const Text('Register'))
      ],
    );
  }
}
