import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/widgets/advertisement_banner.dart';
import 'package:video_streaming_mockup/ui/video_player_page.dart';
import 'package:video_streaming_mockup/widgets/video_tile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        key: PageStorageKey('HomePage'),
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(16),
              child: VideoTile(
                thumbnailUrl:
                    "https://i.insider.com/5e8f427ac023204234683226?width=720&format=jpeg&auto=webpw",
                videoTitle:
                    'Video Name, Lengthening the Title for the Idea of the Title Placement',
                channelName: 'Channel Name',
                views: 2738,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => VideoPlayerPage(),
                    ),
                  );
                },
              ),
            ),
        separatorBuilder: (context, index) => AdvertisementBanner());
  }
}
