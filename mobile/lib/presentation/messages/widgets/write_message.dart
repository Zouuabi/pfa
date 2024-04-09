import 'package:flutter/material.dart';

class WriteMessage extends StatelessWidget {
  const WriteMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Write a message...',
                  filled: true,
                  border: OutlineInputBorder()),
            ),
          ),
        ),
        Expanded(
            child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up))),
      ],
    );
  }
}
