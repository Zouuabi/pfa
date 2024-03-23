import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller,
      required this.errorText,
      this.isPassword = false});

  final String label;
  final String hintText;
  final bool isPassword;
  final String? errorText;
  final TextEditingController controller;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool isVisible;

  @override
  void initState() {
    // true
    isVisible = !widget.isPassword;

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        const SizedBox(height: 5),
        TextField(
          obscureText: !isVisible,
          obscuringCharacter: '*',
          controller: widget.controller,
          decoration: InputDecoration(
              errorText: widget.errorText,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible ^= true;
                        });
                      },
                      icon: isVisible
                          ? const Icon(Icons.panorama_fish_eye_outlined)
                          : const Icon(Icons.remove_red_eye_outlined))
                  : null,
              hintText: widget.hintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        )
      ],
    );
  }
}
