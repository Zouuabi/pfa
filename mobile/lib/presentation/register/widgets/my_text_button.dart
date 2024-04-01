import 'package:flutter/material.dart';
import 'package:mobile/core/config/image_manager.dart';

class Intrest extends StatelessWidget {
  const Intrest({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.child,
  });
  final String child;
  final IconData icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const Icon(Icons.g_mobiledata), Text(child)],
      ),
    );
  }
}
