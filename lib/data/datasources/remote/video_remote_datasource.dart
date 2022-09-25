


import 'package:ubongo/data/datasources/remote/constants/video_remote_datasource_constants.dart';
import 'package:ubongo/data/models/video_model.dart';

import '../../../common/http/http_client.dart';

class VideoRemoteDatasource {
  final HttpClient httpClient;
  VideoRemoteDatasource({required this.httpClient});

  Future<List<VideoModel>> getAll() async {
    final List<dynamic> data =
        await httpClient.get(VideoEndpoints.getCreateUpdateDeletePath);
    return VideoModel.fromJsonList(data);
  }

  Future<VideoModel> create(VideoModel video) async {
    final Map<String, dynamic> data = await httpClient.post(
      VideoEndpoints.getCreateUpdateDeletePath,
      video.toJson(),
    );
    return VideoModel.fromJson(data);
  }

  Future<VideoModel> update(VideoModel video) async {
    final Map<String, dynamic> data = await httpClient.put(
      '${VideoEndpoints.getCreateUpdateDeletePath}/${video.id}',
      video.toJson(),
    );
    return VideoModel.fromJson(data);
  }

  Future<VideoModel> delete(String id) async {
    final Map<String, dynamic> data = await httpClient.delete(
      '${VideoEndpoints.getCreateUpdateDeletePath}/$id',
    );
    return VideoModel.fromJson(data);
  }
}
