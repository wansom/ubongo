import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubongo/domain/entities/video_entity.dart';
import 'package:ubongo/domain/usescases/video_usecase.dart';
import 'package:ubongo/presentation/journey/video/bloc/video_event.dart';
import 'package:ubongo/presentation/journey/video/bloc/video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoUsecase videoUsecase;
  final VideoState ?videoState;

  VideoBloc({required this.videoUsecase,  this.videoState}) : super(videoState!);

  VideoState get initialState => InitialVideos();

  Stream<VideoState> mapEventToState(event) async* {
    switch (event.runtimeType) {
      case FetchVideos:
        yield* _mapFetchVideoState(event);
        break;
      case AddVideo:
        yield* _mapAddVideoState(event);
        break;
      case UpdateVideo:
        yield* _mapUpdateVideoState(event);
        break;
      case DeleteVideo:
        yield* _mapDeleteVideoState(event);
        break;
      default:
    }
  }

  Stream<VideoState> _mapFetchVideoState(FetchVideos event) async* {
    yield LoadingVideos(videos: state.videos!);
    try {
      final videos = await videoUsecase.getAll(fromLocal: event.fromLocal);
      yield LoadedVideos(videos: videos);
    } catch (e) {
      yield const ErrorVideos();
    }
  }

  Stream<VideoState> _mapAddVideoState(AddVideo event) async* {
    final videos = state.videos;
    yield LoadingVideos(videos: videos!);
    try {
      final video = VideoEntity(
          description: event.description, completed: false, id: "null");
      final updatedVideo = await videoUsecase.create(video);
      videos.add(updatedVideo);
      yield LoadedVideos(videos: videos);
    } catch (e) {
      yield const ErrorVideos();
    }
  }

  Stream<VideoState> _mapUpdateVideoState(UpdateVideo event) async* {
    final videos = state.videos;
    yield LoadingVideos(videos: videos!);
    try {
      final video = videos.singleWhere((VideoEntity video) => video.id == event.id);
      video.completed = !video.completed;
      final updatedVideo = await videoUsecase.update(video);
      videos[videos.indexWhere((VideoEntity video) => video.id == updatedVideo.id)] =
          updatedVideo;
      yield LoadedVideos(videos: videos);
    } catch (e) {
      yield const ErrorVideos();
    }
  }

  Stream<VideoState> _mapDeleteVideoState(DeleteVideo event) async* {
    final videos = state.videos;
    yield LoadingVideos(videos: videos!);
    try {
      await videoUsecase.delete(event.id);
      videos.removeWhere((VideoEntity video) => video.id == event.id);
      yield LoadedVideos(videos: videos);
    } catch (e) {
      yield const ErrorVideos();
    }
  }
}
