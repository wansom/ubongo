
import 'package:ubongo/data/models/video_model.dart';
import 'package:ubongo/domain/entities/video_entity.dart';
import 'package:ubongo/domain/repositories/video_repository.dart';

class VideoUsecase {
  final VideoRepository? videoRepository;

  VideoUsecase({this.videoRepository});

  Future<List<VideoEntity>> getAll({required bool fromLocal}) async =>
      videoRepository!.getAll(fromLocal: fromLocal);

  Future<VideoEntity> create(VideoEntity video) async {
    final VideoModel videoModel = VideoModel.castFromEntity(video);
    return videoRepository!.create(videoModel);
  }

  Future<VideoEntity> update(VideoEntity video) async {
    final VideoModel videoModel = VideoModel.castFromEntity(video);
    return videoRepository!.update(videoModel);
  }

  Future<void> delete(String id) async => videoRepository!.delete(id);
}
