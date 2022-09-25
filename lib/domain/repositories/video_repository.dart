

import 'package:ubongo/data/models/video_model.dart';
import 'package:ubongo/domain/entities/video_entity.dart';

abstract class VideoRepository {
  Future<List<VideoEntity>> getAll({bool fromLocal});

  Future<VideoEntity> create(VideoModel video);

  Future<VideoEntity> update(VideoModel video);

  Future<void> delete(String id);
}
