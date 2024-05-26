import 'package:flutter/material.dart';
import 'package:mobile/core/config/image_manager.dart';
import 'package:mobile/presentation/feed/widgets/create_project.dart';
import 'package:mobile/presentation/feed/widgets/project.dart';

import 'package:mobile/presentation/shared/search_barz.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({
    super.key,
  });

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
          title: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.05),
            child: Row(children: [
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
        ),
        SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              final double width = MediaQuery.sizeOf(context).width;
              final double margin = width > 600 ? width * 0.2 : 0;

              if (index == 0) {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: margin),
                    child: const CreateProject());
              }
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: margin),
                  child: const Project());
            })
      ],
    );
  }
}
