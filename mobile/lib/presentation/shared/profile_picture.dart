import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 60,
        height: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            'https://th.bing.com/th/id/R.1150865efae3b2f32b85f397decbbf16?rik=yLVMcyH4AxaUVw&pid=ImgRaw&r=0',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
