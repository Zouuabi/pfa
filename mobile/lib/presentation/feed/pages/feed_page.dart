import 'package:flutter/material.dart';
import 'package:mobile/core/config/image_manager.dart';
import 'package:mobile/data/models/user.dart';
import 'package:mobile/presentation/feed/widgets/create_project.dart';
import 'package:mobile/presentation/feed/widgets/project.dart';
import 'package:mobile/presentation/shared/search_barz.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({
    super.key,
    required this.user,
  });
  final User user;
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          floating: true,
          title: Row(children: [
            const Expanded(flex: 4, child: SearchBarz()),
            Expanded(
                child: Card(
              elevation: 6,
              child: SizedBox(
                height: 55,
                child: GestureDetector(
                    onTap: () {}, child: Image.asset(ImageManager.filter)),
              ),
            ))
          ]),
        ),
        SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              if (index == 0) {
                return CreateProject(user: widget.user);
              }
              return const Project();
            })
      ],
    );
  }
}
