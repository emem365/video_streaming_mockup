import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/model/video.dart';
import 'package:video_streaming_mockup/ui/youtube_video_player_screen.dart';
import 'package:video_streaming_mockup/util/utilities.dart';

class VideoTile extends StatelessWidget {
  final Video video;
  VideoTile({this.video});

  void openVideoPlayer(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => YoutubeVideoPlayerScreen(video: video)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openVideoPlayer(context),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: video.thumbnailUrl,
                  progressIndicatorBuilder: (context, __, ___) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (_, __, ___) => Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                video.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Row(
              children: <Widget>[
                Text(video.channelTitle,
                    style: Theme.of(context).textTheme.bodyText1),
                SizedBox(width: 30),
                Text(Utilities.countToString(video.views)+' views'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
