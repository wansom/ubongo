import 'package:flutter/material.dart';
import 'package:ubongo/domain/entities/video_entity.dart';


class VideoItem extends StatelessWidget {
  final VideoEntity video;
  final Function onUpdate;
  final Function onDelete;

  const VideoItem({Key? key, required this.video, required this.onUpdate, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(video.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          onDelete();
        }
      },
      child: ListTile(
        title: Text(
          video.description,
          style: video.completed
              ? Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(decoration: TextDecoration.lineThrough)
              : Theme.of(context).textTheme.bodyText1,
        ),
        leading: IconButton(
          key: ValueKey('${video.id}_icon'),
          onPressed: onUpdate(),
          icon: Icon(
            video.completed
                ? Icons.check_circle_rounded
                : Icons.check_circle_outline,
          ),
        ),
      ),
    );
  }
}
