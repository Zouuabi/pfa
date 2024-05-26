import 'user.dart';

//! the user fields must be  nullable
// ! since in some case would not contains all infos

class Projectz {
  Projectz(
      {this.id,
      required this.owner,
      required this.title,
      required this.intro,
      this.description,
      this.keywords,
      required this.createdAt,
      this.members,
      this.roomId,
      required this.likes,
      required this.popularity});

  /// the id represents the project ID
  /// nullabe because the id is generated automatically while creating it
  final String? id;

  /// includes owner name profile_url and id
  /// !  must be changed to a map
  final User owner;

  /// the title of the project
  final String title;

  /// an overview about the project
  final String intro;

  /// reperesents a detailed description
  /// nullabe for the seek of preview in the feed screen
  final String? description;

  /// keywords represents a list of category tags
  /// nullabe for the seek of preview in the feed screen
  final List<String>? keywords;

  /// date when the project is created
  final String createdAt;

  /// list of members id
  /// nullabe for the seek of preview in the feed screen
  final List<String>? members;

  /// the associated chat room for the project
  /// nullabe for the seek of preview in the feed screen
  final String? roomId;

  /// number of likes
  /// while creation must be set to zero
  final int likes;

  /// a ratio calculated with a specified formula
  /// used for recommendation
  /// while creation must be set to zero
  final double popularity;

  factory Projectz.fromJson(Map<String, dynamic> json) {
    return Projectz(
      id: json['id'] as String?,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      title: json['title'] as String,
      intro: json['intro'] as String,
      description: json['description'] as String?,
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'],
      members:
          (json['members'] as List<dynamic>?)?.map((e) => e as String).toList(),
      roomId: json['roomId'] as String?,
      likes: json['likes'] ?? 0,
      popularity: (json['popularity'] ?? 0.0 as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner': owner.toJson(),
      'title': title,
      'intro': intro,
      'description': description,
      'keywords': keywords,
      'createdAt': createdAt,
      'members': members,
      'roomId': roomId,
      'likes': likes,
      'popularity': popularity,
    };
  }
}
