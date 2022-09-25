

import 'package:ubongo/domain/entities/video_entity.dart';

class VideoModel extends VideoEntity {
  VideoModel({
    required String id,
    required String description,
    required bool completed,
  }) : super(
          id: id,
          description: description,
          completed: completed,
        );

  factory VideoModel.fromJson(dynamic json) => VideoModel(
        id: json['_id'],
        description: json['description'],
        completed: json['completed'] ?? false,
      );

  static List<VideoModel> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((json) => VideoModel.fromJson(json)).toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['completed'] = completed;
    // ignore: unnecessary_null_comparison
    if (description != null) {
      json['description'] = description;
    }
    return json;
  }

  VideoModel.castFromEntity(final VideoEntity video)
      : super(
          id: video.id,
          description: video.description,
          completed: video.completed,
        );
}
