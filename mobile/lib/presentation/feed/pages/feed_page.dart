import 'package:flutter/material.dart';
import 'package:mobile/core/config/image_manager.dart';
import 'package:mobile/data/models/projectz.dart';
import 'package:mobile/presentation/feed/widgets/create_project.dart';
import 'package:mobile/presentation/feed/widgets/project.dart';
import 'package:mobile/presentation/post_project/pages/post_project_page.dart';
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

  List<Projectz> data = [
    Projectz(
      id: 1,
      ownerName: 'Othmen',
      ownerPhoto:
          'https://scontent.ftun8-1.fna.fbcdn.net/v/t39.30808-6/275185387_156696223403908_4950402848171890081_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_ohc=ovVjBIq4lOQQ7kNvgGxMxgh&_nc_ht=scontent.ftun8-1.fna&oh=00_AYAlizpiJSzXhN0By69vjM_ICTZe9g3bqQZCxuw7RWZbug&oe=66599616',
      title: 'Team Bey Web Version',
      intro: 'Team Bey web version Project using React',
      description: 'This is a detailed description ',
      keywords: ['keyword1', 'keyword2'],
      createdAt: '2 days ago',
      members: ['member1', 'member2'],
      roomId: 'room1',
      likes: 998,
      popularity: 0.8,
    ),
    Projectz(
      id: 2,
      ownerName: 'Zouuabi',
      ownerPhoto:
          'https://www.oubeid.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fprofile-pic.52928098.png&w=640&q=75',
      title: 'Team Bey Bakcend App',
      intro: 'This is Team Bey using Dart_Frog',
      description: 'This is a detailed description ',
      keywords: ['keyword3', 'keyword4'],
      createdAt: '1 day ago',
      members: ['member3', 'member4'],
      roomId: 'room2',
      likes: 997,
      popularity: 0.9,
    ),
    Projectz(
      id: 2,
      ownerName: 'Sarra',
      ownerPhoto:
          'https://scontent.ftun8-1.fna.fbcdn.net/v/t39.30808-6/318155242_1163346024556694_3943461047928511917_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_ohc=1lu6bbDytq4Q7kNvgHgxqx8&_nc_ht=scontent.ftun8-1.fna&oh=00_AYD-_GwZ4CD0z5aTu9uhabgCiB8eg2QZMQo44kLhc7OzDQ&oe=66599706',
      title: 'Team Bey Mobile Version using ',
      intro: 'Team Bey web version Project movile version using Flutter',
      description: 'This is a detailed description ',
      keywords: ['keyword3', 'keyword4'],
      createdAt: '1 day ago',
      members: ['member3', 'member4'],
      roomId: 'room2',
      likes: 997,
      popularity: 0.9,
    ),
  ];

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
            itemCount: data.length + 1,
            itemBuilder: (context, index) {
              final double width = MediaQuery.sizeOf(context).width;
              final double margin = width > 600 ? width * 0.2 : 0;

              if (index == 0) {
                return GestureDetector(
                  onTap: () async {
                    final project = await Navigator.of(context)
                        .pushNamed(PostProjectPage.route);
                    if (project != null) {
                      final Projectz p = project as Projectz;

                      setState(() {
                        data.add(p);
                      });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: margin),
                    child: const CreateProject(),
                  ),
                );
              }
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: margin),
                  child: Project(
                    description: data[index - 1].description,
                    ago: data[index - 1].createdAt,
                    intro: data[index - 1].intro,
                    likes: data[index - 1].likes,
                    profileUrl: data[index - 1].ownerPhoto,
                    userName: data[index - 1].ownerName,
                    title: data[index - 1].title,
                  ));
            })
      ],
    );
  }
}
