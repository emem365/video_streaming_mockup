import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/ui/video_player_page.dart';
import 'package:video_streaming_mockup/widgets/video_tile.dart';

class FollowingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey('FavoritesPage'),
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(16),
        child: VideoTile(
          thumbnailUrl:
              "https://theblogimages.adobe.com/wp-content/uploads/2040/10/Ai-Blog-Header-2-1800x0-c-default.png",
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
    );
  }
}
