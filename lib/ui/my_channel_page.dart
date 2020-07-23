import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/ui/app_screen.dart';
import 'package:video_streaming_mockup/ui/followers_page.dart';
import 'package:video_streaming_mockup/ui/following_page.dart';
import 'package:video_streaming_mockup/widgets/small_video_tile.dart';

class MyChannelPage extends StatelessWidget {
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
          'Channel Name',
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
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  radius: 36,
                ),
                title: Text('Channel Name',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.bold)),
                trailing: OutlineButton(
                  onPressed: () {},
                  child: Text('   UPLOAD   '),
                  color: Colors.black87,
                  borderSide: BorderSide(
                    width: 2,
                  ),
                ),
              ),
              SizedBox(
                height: 75,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('140',
                              style: Theme.of(context).textTheme.subtitle2),
                          Text('Videos',
                              style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FollowersPage(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('24k',
                                style: Theme.of(context).textTheme.subtitle2),
                            Text('Followers',
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
                            Text('24k',
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
                    text: 'New Uploads',
                  ),
                  Tab(
                    text: 'All Videos',
                  ),
                ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  _latestVideos(),
                  _allVideos(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _latestVideos() => ListView.builder(
        key: PageStorageKey('LatestVideos'),
        itemCount: 5,
        itemBuilder: (_, __) => SmallVideoTile(
          thumbnailUrl:
              "https://i.insider.com/5e8f427ac023204234683226?width=720&format=jpeg&auto=webpw",
          videoTitle:
              'Video Name, Lengthening the Title for the Idea of the Title Placement',
          views: 2759,
          lengthInMinutes: "04:08 mins",
          channelName: 'Channel Name',
          onTap: () {},
        ),
      );
  Widget _allVideos() => ListView.builder(
        key: PageStorageKey('AllVideos'),
        itemCount: 5,
        itemBuilder: (_, __) => SmallVideoTile(
          thumbnailUrl: "https://s2.dmcdn.net/v/HvVBH1O3T82ECA5Uk/x1080",
          videoTitle:
              'Video Name, Lengthening the Title for the Idea of the Title Placement',
          views: 2759,
          lengthInMinutes: "04:08 mins",
          channelName: 'Channel Name',
          onTap: () {},
        ),
      );
}
