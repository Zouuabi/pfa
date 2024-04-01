import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  const GenderButton({
    super.key,
    required this.color,
    required this.child,
    required this.ontap,
  });
  final Color color;
  final String child;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  color == const Color.fromARGB(255, 242, 239, 239)
                      ? color
                      : Colors.tealAccent,
                  color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          height: 50,
          width: MediaQuery.sizeOf(context).width * 0.4,
          child: Center(
              child: Text(
            child,
            style: const TextStyle(fontSize: 18),
          ))),
    );
  }
}
