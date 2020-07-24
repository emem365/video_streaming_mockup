import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/model/video.dart';
import 'package:video_streaming_mockup/model/channel.dart';
import 'package:video_streaming_mockup/services/api_service.dart';
import 'package:video_streaming_mockup/ui/coins_page.dart';
import 'package:video_streaming_mockup/util/utilities.dart';
import 'package:video_streaming_mockup/widgets/advertisement_banner.dart';
import 'package:video_streaming_mockup/ui/channel_page.dart';
import 'package:video_streaming_mockup/widgets/follow_button.dart';
import 'package:video_streaming_mockup/widgets/icon_button_with_label.dart';
import 'package:video_streaming_mockup/widgets/small_video_tile.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayerScreen extends StatefulWidget {
  final Video video;
  YoutubeVideoPlayerScreen({this.video});
  @override
  _YoutubeVideoPlayerScreenState createState() =>
      _YoutubeVideoPlayerScreenState();
}

class _YoutubeVideoPlayerScreenState extends State<YoutubeVideoPlayerScreen> {
  YoutubePlayerController _controller;
  double volume = 100;
  bool _isPlayerReady = false;
  Channel channel;
  Future<List<Video>> getData() async {
    channel =
        await APIService.instance.fetchChannelFromId(widget.video.channelId);

    return APIService.instance
        .fetchMostPopularVideos(categoryId: widget.video.categoryId);
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.video.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  // void listener() {
  //   if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
  //     setState(() {
  //       _state = _controller.value.playerState;
  //       _metadata = _controller.metadata;
  //     });
  //   }
  // }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(
            width: 4,
          ),
          BackButton(
            color: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          PopupMenuButton(
            itemBuilder: (_) => [PopupMenuItem(child: Text('Settings'))],
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
      ),
      builder: (context, player) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              player,
              Expanded(
                child: FutureBuilder<List<Video>>(
                  future: getData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Video>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return _buildListView(context, snapshot.data);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView(BuildContext context, List<Video> data) => ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8, 16.0, 8.0),
            child: Row(
              children: <Widget>[
                Text(Utilities.dateTimeToDuration(widget.video.publishedAt),
                    style: Theme.of(context).textTheme.caption),
                SizedBox(width: 50),
                Text(Utilities.countToString(widget.video.views) + ' views',
                    style: Theme.of(context).textTheme.caption),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 8),
            child: Text(
              widget.video.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButtonWithLabel(
                icon: Icon(Icons.favorite),
                label: 'Like',
              ),
              IconButtonWithLabel(
                icon: Icon(Icons.thumb_down),
                label: 'Dislike',
              ),
              IconButtonWithLabel(
                icon: Icon(
                  Icons.shopping_basket,
                ),
                label: 'Gift',
                toggleOnTap: false,
                onPressed: () {
                  _controller.pause();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CoinsPage()));
                },
              ),
              IconButtonWithLabel(
                icon: Icon(Icons.share),
                label: 'Share',
                toggleOnTap: false,
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('http://www.youtube.com/watch?v=' +
                          widget.video.id)));
                },
              ),
              IconButtonWithLabel(
                icon: Icon(Icons.comment),
                label: 'Comment',
                toggleOnTap: false,
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Comments are disabled right now.')));
                },
              ),
            ],
          ),
          Divider(),
          ListTile(
            onTap: () {
              _controller.pause();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ChannelPage(channel: channel),
                ),
              );
            },
            leading: CircleAvatar(
              child: CachedNetworkImage(
                  imageUrl: channel.thumbnailUrl,
                  placeholder: (
                    _,
                    __,
                  ) =>
                      Icon(Icons.person, color: Colors.blue)),
            ),
            title: Text(channel.title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontWeight: FontWeight.bold)),
            subtitle: Text(Utilities.countToString(channel.subscriberCount) +
                ' subscribers'),
            trailing: FollowButton(
              initiallyFollowed: false,
            ),
          ),
          AdvertisementBanner(),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16.0),
            child: Text('You May Also Like',
                style: Theme.of(context).textTheme.bodyText1),
          ),
          ...List.generate(
            data.length,
            (index) => SmallVideoTile(
              video: data[index],
            ),
          )
        ],
      );
}
