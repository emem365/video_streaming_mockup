import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/model/channel.dart';
import 'package:video_streaming_mockup/model/video.dart';
import 'package:video_streaming_mockup/services/api_service.dart';
import 'package:video_streaming_mockup/ui/app_screen.dart';
import 'package:video_streaming_mockup/util/utilities.dart';
import 'package:video_streaming_mockup/widgets/follow_button.dart';
import 'package:video_streaming_mockup/ui/followers_page.dart';
import 'package:video_streaming_mockup/ui/following_page.dart';
import 'package:video_streaming_mockup/widgets/small_video_tile.dart';

class ChannelPage extends StatelessWidget {
  final Channel channel;
  ChannelPage({this.channel});
  final List<Map> tabs = [
    {
      'title': 'Home',
      'icon': Icons.home,
    },
    {
      'title': 'Trending',
      'icon': Icons.trending_up,
    },
    {
      'title': 'Following',
      'icon': Icons.favorite,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          channel.title,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.w300, fontSize: 20.0),
        ),
        centerTitle: true,
        leading: BackButton(),
        actions: <Widget>[IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => AppScreen(
                initialIndex: index,
              ),
            ),
          );
        },
        currentIndex: 1,
        elevation: 4.0,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.black54,
        items: tabs
            .map<BottomNavigationBarItem>(
              (tab) => BottomNavigationBarItem(
                icon: Icon(tab['icon']),
                title: Text(tab['title']),
              ),
            )
            .toList(),
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: Column(
            children: <Widget>[
              ListTile(
                  leading: CircleAvatar(
                    child: CachedNetworkImage(
                        imageUrl: channel.thumbnailUrl,
                        placeholder: (
                          _,
                          __,
                        ) =>
                            Icon(Icons.person, color: Colors.blue)),
                    radius: 36,
                  ),
                  title: Text(channel.title,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.bold)),
                  trailing: FollowButton(
                    initiallyFollowed: false,
                  )),
              SizedBox(
                height: 75,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(Utilities.countToString(channel.videoCount),
                              style: Theme.of(context).textTheme.subtitle2),
                          Text('Videos',
                              style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Can\'t show subscribers of channel without channel permission')));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                Utilities.countToString(
                                    channel.subscriberCount),
                                style: Theme.of(context).textTheme.subtitle2),
                            Text('Subscribers',
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FollowingPage(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('17',
                                style: Theme.of(context).textTheme.subtitle2),
                            Text('Following',
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                    ]),
              ),
              PreferredSize(
                preferredSize: Size.fromHeight(30),
                child: TabBar(tabs: [
                  Tab(
                    text: 'Latest Videos',
                  ),
                  Tab(
                    text: 'All Videos',
                  ),
                ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  _latestVideos(context),
                  _allVideos(context),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _latestVideos(BuildContext context) => FutureBuilder<List<Video>>(
        future: APIService.instance.fetchVideosFromChannelId(channel.id),
        builder: (BuildContext context, AsyncSnapshot<List<Video>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              key: PageStorageKey('LatestVideos'),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => SmallVideoTile(
                video: snapshot.data[index],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );

  Widget _allVideos(BuildContext context) => FutureBuilder<List<Video>>(
        future: APIService.instance
            .fetchVideosFromChannelId(channel.id, maxCount: 50),
        builder: (BuildContext context, AsyncSnapshot<List<Video>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              key: PageStorageKey('AllVideos'),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => SmallVideoTile(
                video: snapshot.data[index],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
}
