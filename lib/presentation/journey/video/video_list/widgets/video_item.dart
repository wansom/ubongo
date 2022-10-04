import 'package:flutter/material.dart';
import 'package:ubongo/domain/entities/video_entity.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  final VideoEntity video;
  final Function onUpdate;
  final Function onDelete;

  const VideoItem(
      {Key? key,
      required this.video,
      required this.onUpdate,
      required this.onDelete})
      : super(key: key);

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.video.toString())
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.video.id),
      direction: DismissDirection.endToStart,
      background: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(),
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          widget.onDelete();
        }
      },
      child: ListTile(
        title: Text(
          widget.video.description,
          style: widget.video.completed
              ? Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(decoration: TextDecoration.lineThrough)
              : Theme.of(context).textTheme.bodyText1,
        ),
        leading: IconButton(
          key: ValueKey('${widget.video.id}_icon'),
          onPressed: widget.onUpdate(),
          icon: Icon(
            widget.video.completed
                ? Icons.check_circle_rounded
                : Icons.check_circle_outline,
          ),
        ),
      ),
    );
  }
}
