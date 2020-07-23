import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/widgets/trending_tabs.dart';
import 'package:video_streaming_mockup/ui/video_player_page.dart';
import 'package:video_streaming_mockup/widgets/video_tile.dart';

class TrendingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey('TrendingPage'),
      itemCount: 5,
      itemBuilder: (context, index) {
        if (index != 0)
          return Padding(
            padding: EdgeInsets.all(16),
            child: VideoTile(
              thumbnailUrl: "https://s2.dmcdn.net/v/HvVBH1O3T82ECA5Uk/x1080",
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
          );
        return TrendingTabs();
      },
    );
  }
}
