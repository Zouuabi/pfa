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
            'https://media.vogue.fr/photos/5ec2b66bc0c493adce32b318/4:3/w_1080,h_810,c_limit/sara-sampaio.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
