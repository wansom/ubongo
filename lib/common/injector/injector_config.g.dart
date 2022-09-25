// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: annotate_overrides

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  @override
  void _configureBlocs() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => VideoBloc(videoUsecase: c<VideoUsecase>()));
  }

  void _configureUsecases() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton(
        (c) => VideoUsecase(videoRepository: c<VideoRepository>()));
  }

  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<VideoRepository>((c) => VideoRepositoryImpl(
        videoRemoteDatasource: c<VideoRemoteDatasource>(),
        videoLocalDatasource: c<VideoLocalDatasource>()));
  }

  void _configureRemoteDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton(
        (c) => VideoRemoteDatasource(httpClient: c<HttpClient>()));
  }

  void _configureLocalDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => VideoLocalDatasource());
  }

  void _configureCommon() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => HttpClient.setVideosAPIhost());
  }
}
