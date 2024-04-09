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
            'https://th.bing.com/th/id/R.42788fc1e7e7985e729bdd58c84c5bc6?rik=avNLSa8SbwjPcg&pid=ImgRaw&r=0',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
