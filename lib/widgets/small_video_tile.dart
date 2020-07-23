import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SmallVideoTile extends StatelessWidget {
  final String thumbnailUrl;
  final String videoTitle;
  final String channelName;
  final String lengthInMinutes;
  final int views;
  final GestureTapCallback onTap;

  SmallVideoTile({
    @required this.thumbnailUrl,
    @required this.videoTitle,
    @required this.channelName,
    @required this.lengthInMinutes,
    @required this.views,
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                    imageUrl: thumbnailUrl,
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
                      videoTitle,
                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 12),
                    ),
                    SizedBox(height: 4),
                    Text(
                      lengthInMinutes,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(channelName,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontSize: 12)),
                        SizedBox(width: 10),
                        Text(viewCountToString(),
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

  String viewCountToString() {
    if (views > 1000000000)
      return (views / 1000000000).toStringAsFixed(1) + 'B views';
    if (views > 1000000)
      return (views / 1000000).toStringAsFixed(1) + 'M views';
    if (views > 1000) return (views / 1000).toStringAsFixed(1) + 'k views';
    return views.toString() + ' views';
  }
}
