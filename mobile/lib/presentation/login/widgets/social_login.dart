import 'package:flutter/material.dart';

import 'package:mobile/core/config/image_manager.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: Image.asset(
              ImageManager.google,
              height: 20,
              width: 20,
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
              onPressed: () {},
              child: Image.asset(
                ImageManager.facebook,
                height: 20,
                width: 20,
              )),
        ),
        Expanded(
          child: ElevatedButton(
              onPressed: () {},
              child: Image.asset(
                ImageManager.apple,
                height: 20,
                width: 20,
              )),
        ),
      ],
    );
  }
}
