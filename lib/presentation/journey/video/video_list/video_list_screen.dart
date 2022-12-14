// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubongo/common/constants/route_constants.dart';
import 'package:ubongo/common/injector/injector.dart';
import 'package:ubongo/domain/entities/video_entity.dart';
import 'package:ubongo/presentation/journey/video/bloc/video_bloc.dart';
import 'package:ubongo/presentation/journey/video/bloc/video_event.dart';
import 'package:ubongo/presentation/journey/video/bloc/video_state.dart';
import 'package:ubongo/presentation/journey/video/video_list/widgets/video_item.dart';
import 'package:ubongo/presentation/journey/video/video_list/widgets/video_list_constants.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({
    Key? key,
  }) : super(key: key);

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  // ignore: close_sinks
  late VideoBloc videoBloc;

  @override
  void initState() {
    super.initState();
    videoBloc = Injector.resolve<VideoBloc>()
      ..add(FetchVideos(fromLocal: false));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Videos'),
          centerTitle: true,
          actions: [
            IconButton(
              key: VideoListConstants.createVideoIcon,
              icon: const Icon(Icons.add),
              onPressed: () =>
                  Navigator.of(context).pushNamed(RouteList.videos),
            )
          ],
        ),
        body: BlocBuilder<VideoBloc, VideoState>(
          bloc: videoBloc,
          builder: (context, todoState) {
            return _mapStateToWidget(todoState);
          },
        ),
      );

  Widget _mapStateToWidget(VideoState todoState) {
    switch (todoState.runtimeType) {
      case LoadingVideos:
        return const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.transparent,
          ),
        );
      case LoadedVideos:
        final List<VideoEntity>? videos = todoState.videos;
        if (videos!.isEmpty) {
          return Center(
            child: ElevatedButton(
              key: VideoListConstants.createVideoButton,
              onPressed: () {
                Navigator.of(context).pushNamed(RouteList.videos);
              },
              child: const Text('Add Video'),
            ),
          );
        }
        return _videoList(videos);
      case ErrorVideos:
        return const Center(
          child: Text('Errored'),
        );
      default:
        return Container();
    }
  }

  Widget _videoList(List<VideoEntity> videos) {
    return RefreshIndicator(
        onRefresh: () async {
          videoBloc.add(FetchVideos(fromLocal: false));
        },
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          // ignore: prefer_const_constructors
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemCount: videos.length,
          itemBuilder: (_, int index) => VideoItem(
            key: ValueKey('${videos[index].id}_item'),
            video: videos[index],
            onUpdate: () => videoBloc
              ..add(
                UpdateVideo(
                  id: videos[index].id,
                ),
              ),
            onDelete: () => videoBloc..add(DeleteVideo(id: videos[index].id)),
          ),
        )
        );
  }
}
