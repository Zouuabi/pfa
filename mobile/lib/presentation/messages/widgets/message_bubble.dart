import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/presentation/shared/profile_picture.dart';

class MessageBubble extends StatelessWidget {
  // must be splitted into to widgets , ashel fl maintenance
  // and more humanly readable
  MessageBubble({
    super.key,
  });
  // only for testing purposes
  final int data = Random().nextInt(100);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          data % 2 == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        data % 2 == 0 ? Container() : const ProfilePicture(),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            data % 2 == 0
                ? Container()
                : Text(
                    'userName',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: data % 2 == 0
                          ? const Radius.circular(20)
                          : Radius.zero,
                      topRight: const Radius.circular(20),
                      bottomLeft: const Radius.circular(20),
                      bottomRight: data % 2 == 0
                          ? Radius.zero
                          : const Radius.circular(20)),
                  color: Colors.teal,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(-1, 1),
                        // color: Colors.grey,
                        blurRadius: 4)
                  ]),
              child: Text(
                'this is a message',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
