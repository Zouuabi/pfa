import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.child, required this.ontap});
  final String child;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 60,
        child: FilledButton(onPressed: ontap, child: Text(child)));
  }
}
