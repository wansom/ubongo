import 'package:flutter/material.dart';
import 'package:ubongo/domain/entities/video_entity.dart';

@immutable
abstract class VideoState {
  final List<VideoEntity> ?videos;
  final bool ?loading;
  const VideoState({this.videos, this.loading});
}

class InitialVideos extends VideoState {
  InitialVideos() : super(videos: [], loading: false);
}

class LoadingVideos extends VideoState {
  const LoadingVideos({required List<VideoEntity> videos}) : super(loading: true);
}

class LoadedVideos extends VideoState {
  const LoadedVideos({required List<VideoEntity> videos}) : super(videos: videos, loading: false);
}

class ErrorVideos extends VideoState {
  const ErrorVideos() : super(loading: false);
}
