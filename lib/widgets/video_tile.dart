import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VideoTile extends StatelessWidget {
  final String thumbnailUrl;
  final String videoTitle;
  final String channelName;
  final int views;
  final GestureTapCallback onTap;

  VideoTile({
    @required this.thumbnailUrl,
    @required this.videoTitle,
    @required this.channelName,
    @required this.views,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                  imageUrl: thumbnailUrl,
                  progressIndicatorBuilder: (context, __, ___) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (_, __, ___) => Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                videoTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Row(
              children: <Widget>[
                Text(channelName, style: Theme.of(context).textTheme.bodyText1),
                SizedBox(width: 30),
                Text(viewCountToString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String viewCountToString() {
    if (views > 1000000000)
      return (views / 1000000000).toStringAsFixed(1) + 'B views';
    if (views > 1000000)
      return (views / 1000000).toStringAsFixed(1) + 'M views';
    if (views > 1000) return (views / 1000).toStringAsFixed(1) + 'k views';
    return views.toString() + ' views';
  }
}