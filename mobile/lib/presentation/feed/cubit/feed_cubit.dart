import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/models/projectz.dart';

enum Status { intial, loading, success, failed }

class FeedCubit extends Cubit<FeedState> {
  FeedCubit() : super(const FeedState(status: Status.intial));

  List<Projectz> data = [
    Projectz(
      id: 1,
      ownerName: 'Othmen',
      ownerPhoto:
          'https://scontent.ftun8-1.fna.fbcdn.net/v/t39.30808-6/275185387_156696223403908_4950402848171890081_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_ohc=ovVjBIq4lOQQ7kNvgGxMxgh&_nc_ht=scontent.ftun8-1.fna&oh=00_AYAlizpiJSzXhN0By69vjM_ICTZe9g3bqQZCxuw7RWZbug&oe=66599616',
      title: 'Team Bey Web Version',
      intro: 'This Team Bey web version using React',
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
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541',
      title: 'Team Bey Mobile Version using Flutter',
      intro: 'This is Team Bey Mobile version',
      description: 'This is a detailed description ',
      keywords: ['keyword3', 'keyword4'],
      createdAt: '1 day ago',
      members: ['member3', 'member4'],
      roomId: 'room2',
      likes: 997,
      popularity: 0.9,
    ),
  ];
}

class FeedState extends Equatable {
  const FeedState({required this.status, this.data});
  final Status status;
  final dynamic data;

  @override
  List<Object> get props => [status];
}
