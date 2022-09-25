import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class VideoEvent extends Equatable {}

class FetchVideos extends VideoEvent {
  final bool fromLocal;
  FetchVideos({required this.fromLocal});

  @override
  List<Object> get props => [fromLocal];
}

class AddVideo extends VideoEvent {
  final String description;
  AddVideo({required this.description});

  @override
  List<Object> get props => [description];
}

class UpdateVideo extends VideoEvent {
  final String id;
  UpdateVideo({required this.id});

  @override
  List<Object> get props => [id];
}

class DeleteVideo extends VideoEvent {
  final String id;
  DeleteVideo({required this.id});

  @override
  List<Object> get props => [id];
}
