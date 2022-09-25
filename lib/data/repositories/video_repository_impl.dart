
// ignore_for_file: avoid_renaming_method_parameters

import 'dart:async';

import 'package:ubongo/data/datasources/local/local_database/video_local_datasource.dart';
import 'package:ubongo/data/datasources/remote/video_remote_datasource.dart';
import 'package:ubongo/data/models/video_model.dart';
import 'package:ubongo/domain/repositories/video_repository.dart';


class VideoRepositoryImpl extends VideoRepository {
  final VideoRemoteDatasource videoRemoteDatasource;
  final VideoLocalDatasource videoLocalDatasource;

  VideoRepositoryImpl({
    required this.videoRemoteDatasource,
    required this.videoLocalDatasource,
  });

  @override
  Future<List<VideoModel>> getAll({bool? fromLocal}) async {
    List<VideoModel> videos = await videoLocalDatasource.getFormattedData();
    if (videos.isEmpty ){
      videos = await videoRemoteDatasource.getAll();

      unawaited(Future.wait(
        [
          videoLocalDatasource.deleteAll(),
          videoLocalDatasource.insertOrUpdateAll(videos),
        ],
      ));
    }
    return videos;
  }

  @override
  
  Future<VideoModel> create(VideoModel videoModel) async {
    final VideoModel video = await videoRemoteDatasource.create(videoModel);
    await videoLocalDatasource.insertOrUpdateItem(video);
    return video;
  }

  @override
  Future<void> delete(String id) async {
    await videoLocalDatasource.delete(id);
  }

  @override
  Future<VideoModel> update(VideoModel model) async {
    final VideoModel video = await videoRemoteDatasource.update(model);
    // ignore: unnecessary_null_comparison
    if (video != null) {
      await videoLocalDatasource.insertOrUpdateItem(video);
    }
    return video;
  }
}
