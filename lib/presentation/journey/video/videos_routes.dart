import 'package:flutter/material.dart';
import 'package:ubongo/common/injector/injector.dart';
import 'package:ubongo/presentation/journey/video/bloc/video_event.dart';
import 'package:ubongo/presentation/journey/video/create_video/create_video_screen.dart';
import 'package:ubongo/presentation/journey/video/video_list/video_list_screen.dart';

import '../../../common/constants/route_constants.dart';
import 'bloc/video_bloc.dart';


class VideoRoutes {
  static VideoBloc get _getVideoBloc => Injector.resolve<VideoBloc>();

  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.videosList: (context) => const VideoListScreen(),
      RouteList.videos: (context) => CreateVideoScreen(
            onCreate: (String description) {
              _getVideoBloc.add(AddVideo(description: description));
              Navigator.of(context).pop();
            },
          ),
    };
  }
}
