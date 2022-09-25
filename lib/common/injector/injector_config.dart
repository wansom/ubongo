import 'package:kiwi/kiwi.dart';

import 'package:ubongo/common/http/http_client.dart';
import 'package:ubongo/data/datasources/local/local_database/video_local_datasource.dart';
import 'package:ubongo/data/datasources/remote/video_remote_datasource.dart';
import 'package:ubongo/data/repositories/video_repository_impl.dart';
import 'package:ubongo/domain/repositories/video_repository.dart';
import 'package:ubongo/domain/usescases/video_usecase.dart';
import 'package:ubongo/presentation/journey/video/bloc/video_bloc.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static KiwiContainer? container;

  static void setup() {
    container = KiwiContainer();
    _$InjectorConfig()._configure();
  }

  // ignore: type_annotate_public_apis
  static final resolve = container!.resolve;

  void _configure() {
    _configureBlocs();
    _configureUsecases();
    _configureRepositories();
    _configureRemoteDataSources();
    _configureLocalDataSources();
    _configureCommon();
  }

  // ============ BLOCS ============
  @Register.singleton(VideoBloc)
  void _configureBlocs();

  // ============ USECASES ============
  @Register.singleton(VideoUsecase)
  void _configureUsecases();

  // ============ REPOSITORIES ============
  @Register.singleton(VideoRepository, from: VideoRepositoryImpl)
  void _configureRepositories();

  // ============ REMOTE DATASOURCES ============
  @Register.singleton(VideoRemoteDatasource)
  void _configureRemoteDataSources();

  // ============ LOCAL DATASOURCES ============
  @Register.singleton(VideoLocalDatasource)
  void _configureLocalDataSources();

  // ============ COMMON ============
  @Register.singleton(HttpClient, constructorName: 'setVideosPIhost')
  void _configureCommon();
}
