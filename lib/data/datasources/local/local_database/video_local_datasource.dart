

import 'package:ubongo/common/constants/local_database_type_constants.dart';
import 'package:ubongo/common/utils/database_util.dart';
import 'package:ubongo/data/datasources/local/local_database/base_local_database.dart';
import 'package:ubongo/data/datasources/local/local_database/tables/video_table.dart';
import 'package:ubongo/data/models/video_model.dart';

class VideoLocalDatasource extends BaseLocalDataSource<VideoTable, VideoModel> {
  VideoLocalDatasource() : super(boxName: HiveTableNameConstants.videoTableName) {
    DatabaseUtil.registerAdapter<VideoTable>(VideoTableAdapter());
  }

  @override
  Future<List<VideoModel>> getFormattedData() async {
    final List<VideoTable> data = await getAll();
    return data.map(VideoTable.toModel).toList();
  }

  Future<void> insertOrUpdateItem(VideoModel todo) async {
    await put(todo.id, VideoTable.fromModel(todo));
  }

  @override
  Future<void> insertOrUpdateAll(List<VideoModel> videos) async {
    final Map<String, VideoTable> todoMap = {
      for (var todo in videos) todo.id: VideoTable.fromModel(todo)
    };
    await putAll(todoMap);
  }
}
