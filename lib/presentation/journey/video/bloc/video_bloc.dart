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
        yield* _mapFetchTodoState(event);
        break;
      case AddVideo:
        yield* _mapAddTodoState(event);
        break;
      case UpdateVideo:
        yield* _mapUpdateTodoState(event);
        break;
      case DeleteVideo:
        yield* _mapDeleteTodoState(event);
        break;
      default:
    }
  }

  Stream<VideoState> _mapFetchTodoState(FetchVideos event) async* {
    yield LoadingVideos(videos: state.videos!);
    try {
      final videos = await videoUsecase.getAll(fromLocal: event.fromLocal);
      yield LoadedVideos(videos: videos);
    } catch (e) {
      yield const ErrorVideos();
    }
  }

  Stream<VideoState> _mapAddTodoState(AddVideo event) async* {
    final videos = state.videos;
    yield LoadingVideos(videos: videos!);
    try {
      final todo = VideoEntity(
          description: event.description, completed: false, id: "null");
      final updatedTodo = await videoUsecase.create(todo);
      videos.add(updatedTodo);
      yield LoadedVideos(videos: videos);
    } catch (e) {
      yield const ErrorVideos();
    }
  }

  Stream<VideoState> _mapUpdateTodoState(UpdateVideo event) async* {
    final todos = state.videos;
    yield LoadingVideos(videos: todos!);
    try {
      final todo = todos.singleWhere((VideoEntity todo) => todo.id == event.id);
      todo.completed = !todo.completed;
      final updatedTodo = await videoUsecase.update(todo);
      todos[todos.indexWhere((VideoEntity todo) => todo.id == updatedTodo.id)] =
          updatedTodo;
      yield LoadedVideos(videos: todos);
    } catch (e) {
      yield const ErrorVideos();
    }
  }

  Stream<VideoState> _mapDeleteTodoState(DeleteVideo event) async* {
    final todos = state.videos;
    yield LoadingVideos(videos: todos!);
    try {
      await videoUsecase.delete(event.id);
      todos.removeWhere((VideoEntity todo) => todo.id == event.id);
      yield LoadedVideos(videos: todos);
    } catch (e) {
      yield const ErrorVideos();
    }
  }
}
