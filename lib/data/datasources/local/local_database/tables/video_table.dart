
// ignore_for_file: overridden_fields

import 'package:hive/hive.dart';
import 'package:ubongo/common/constants/local_database_type_constants.dart';
import 'package:ubongo/data/models/video_model.dart';

part 'video_table.g.dart';

@HiveType(typeId: HiveTypeIdConstants.customerTableId)
class VideoTable extends VideoModel {
  @override
  @HiveField(1)
  String id;

  @override
  @HiveField(2)
  String description;

  @override
  @HiveField(3)
  bool completed;

  VideoTable({required this.id, required this.description, required this.completed})
      : super(
          id: id,
          description: description,
          completed: completed,
        );

  factory VideoTable.fromModel(VideoModel model) => VideoTable(
        id: model.id,
        description: model.description,
        completed: model.completed,
      );

  static VideoModel toModel(VideoTable table) => VideoModel(
        id: table.id,
        description: table.description,
        completed: table.completed,
      );
}
