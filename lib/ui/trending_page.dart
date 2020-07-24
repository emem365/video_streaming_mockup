import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/model/video.dart';
import 'package:video_streaming_mockup/services/api_service.dart';
import 'package:video_streaming_mockup/widgets/trending_tabs.dart';
import 'package:video_streaming_mockup/widgets/video_tile.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  String _currentCategory = 'music';

  final Map categories = {
    'music': '10',
    'sports': '17',
    'games': '20',
    'comedy': '23',
  };

  void musicOnPressed() => setState(() => _currentCategory = 'music');
  void sportsOnPressed() => setState(() => _currentCategory = 'sports');
  void gamesOnPressed() => setState(() => _currentCategory = 'games');
  void comedyOnPressed() => setState(() => _currentCategory = 'comedy');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TrendingTabs(
          musicOnPressed: musicOnPressed,
          sportsOnPressed: sportsOnPressed,
          gamesOnPressed: gamesOnPressed,
          comedyOnPressed: comedyOnPressed,
        ),
        Expanded(
          child: FutureBuilder<List<Video>>(
            future: APIService.instance.fetchMostPopularVideos(
                categoryId: categories[_currentCategory]),
            builder:
                (BuildContext context, AsyncSnapshot<List<Video>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                print(snapshot.data);
                return ListView.builder(
                    key: PageStorageKey('TrendingPage'),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(16),
                          child: VideoTile(
                            video: snapshot.data[index],
                          ),
                        ));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
