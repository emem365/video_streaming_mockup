import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/model/video.dart';
import 'package:video_streaming_mockup/ui/youtube_video_player_screen.dart';
import 'package:video_streaming_mockup/util/utilities.dart';

class SmallVideoTile extends StatelessWidget {
  final Video video;

  SmallVideoTile({
    @required this.video,
  });
  void openVideoPlayer(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => YoutubeVideoPlayerScreen(video: video)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openVideoPlayer(context),
      child: SizedBox(
        height: 125,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: video.thumbnailUrl,
                    progressIndicatorBuilder: (context, __, ___) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (_, __, ___) =>
                        Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      video.title,
                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 12),
                    ),
                    SizedBox(height: 4),
                    //TODO
                    // Text(
                    //   lengthInMinutes,
                    //   style: Theme.of(context).textTheme.caption,
                    // ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            video.channelTitle,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 10),
                        if (video.views != null)
                          Text(Utilities.countToString(video.views) + ' views',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(fontSize: 12)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
