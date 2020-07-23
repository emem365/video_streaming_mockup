import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/ui/followings_page.dart';
import 'package:video_streaming_mockup/ui/home_page.dart';
import 'package:video_streaming_mockup/ui/my_channel_page.dart';
import 'package:video_streaming_mockup/ui/settings_page.dart';
import 'package:video_streaming_mockup/ui/trending_page.dart';

class AppScreen extends StatefulWidget {
  final int initialIndex;
  AppScreen({this.initialIndex = 0});
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  List<Map> tabs = [
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
  int currentIndex;
  PageController _controller;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _controller =
        PageController(initialPage: widget.initialIndex, keepPage: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
          child: Column(children: [
        DrawerHeader(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text('Youtube Clone', style: Theme.of(context).textTheme.headline4),
          ),
        ),
        ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage(),
                ),
              );
            })
      ])),
      appBar: AppBar(
        title: Text(
          tabs[currentIndex]['title'],
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.w300, fontSize: 20.0),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => MyChannelPage(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
              _controller.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
            });
          },
          currentIndex: currentIndex,
          elevation: 4.0,
          selectedItemColor: Colors.blue,
          items: tabs
              .map<BottomNavigationBarItem>((tab) => BottomNavigationBarItem(
                    icon: Icon(tab['icon']),
                    title: Text(tab['title']),
                  ))
              .toList()),
      body: PageView(
        onPageChanged: (index) => setState(() => currentIndex = index),
        controller: _controller,
        children: <Widget>[
          HomePage(),
          TrendingPage(),
          FollowingsPage(),
        ],
      ),
    );
  }
}
