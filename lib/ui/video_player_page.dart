import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/widgets/advertisement_banner.dart';
import 'package:video_streaming_mockup/ui/channel_page.dart';
import 'package:video_streaming_mockup/widgets/follow_button.dart';
import 'package:video_streaming_mockup/widgets/icon_checkbox_with_label.dart';
import 'package:video_streaming_mockup/widgets/small_video_tile.dart';
import 'package:video_streaming_mockup/widgets/video_player_screen.dart';

class VideoPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            children: [
              VideoPlayerScreen(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4, 16.0, 8.0),
                child: Row(
                  children: <Widget>[
                    Text('2 months ago',
                        style: Theme.of(context).textTheme.caption),
                    SizedBox(width: 50),
                    Text('2.7M views',
                        style: Theme.of(context).textTheme.caption),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 8),
                child: Text(
                  'Video Name, Lengthening the Title for the Idea of the Title Placement',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconCheckboxWithLabel(
                    icon: Icon(Icons.favorite),
                    label: 'Like',
                  ),
                  IconCheckboxWithLabel(
                    icon: Icon(Icons.thumb_down),
                    label: 'Dislike',
                  ),
                  IconCheckboxWithLabel(
                    icon: Icon(
                      Icons.shopping_basket,
                    ),
                    label: 'Gift',
                  ),
                  IconCheckboxWithLabel(
                    icon: Icon(Icons.share),
                    label: 'Share',
                  ),
                  IconCheckboxWithLabel(
                    icon: Icon(Icons.comment),
                    label: 'Comment',
                  ),
                ],
              ),
              Divider(),
              ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => ChannelPage(),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    child: Icon(Icons.person, color: Colors.blue),
                  ),
                  title: Text('Channel Name',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.bold)),
                  subtitle: Text('123k followers'),
                  trailing: FollowButton(
                    initiallyFollowed: false,
                  )),
              AdvertisementBanner(),
              Padding(
                padding: EdgeInsets.only(top: 16, left: 16.0),
                child: Text('You May Also Like',
                    style: Theme.of(context).textTheme.bodyText1),
              ),
              SmallVideoTile(
                thumbnailUrl:
                    "https://i.insider.com/5e8f427ac023204234683226?width=720&format=jpeg&auto=webpw",
                videoTitle:
                    'Video Name, Lengthening the Title for the Idea of the Title Placement',
                views: 2759,
                lengthInMinutes: "04:08 mins",
                channelName: 'Channel Name',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => VideoPlayerPage(),
                    ),
                  );
                },
              ),
              SmallVideoTile(
                thumbnailUrl:
                    "https://i.insider.com/5e8f427ac023204234683226?width=720&format=jpeg&auto=webpw",
                videoTitle:
                    'Video Name, Lengthening the Title for the Idea of the Title Placement',
                views: 2759,
                lengthInMinutes: "04:08 mins",
                channelName: 'Channel Name',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => VideoPlayerPage(),
                    ),
                  );
                },
              ),
              SmallVideoTile(
                thumbnailUrl:
                    "https://i.insider.com/5e8f427ac023204234683226?width=720&format=jpeg&auto=webpw",
                videoTitle:
                    'Video Name, Lengthening the Title for the Idea of the Title Placement',
                views: 2759,
                lengthInMinutes: "04:08 mins",
                channelName: 'Channel Name',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => VideoPlayerPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          SafeArea(
            child: Row(
              children: <Widget>[
                BackButton(),
                Spacer(),
                PopupMenuButton(
                    itemBuilder: (
                  BuildContext context,
                ) =>
                        [
                          PopupMenuItem(
                            enabled: true,
                            height: 30,
                            child: Text('Hello'),
                          ),
                        ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
