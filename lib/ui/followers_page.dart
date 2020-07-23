import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/ui/app_screen.dart';
import 'package:video_streaming_mockup/widgets/follow_button.dart';

class FollowersPage extends StatelessWidget {
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
          'Followers',
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
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 16,
          ),
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
            subtitle: Text('123k followers | 123k following'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Text('Followers', style: Theme.of(context).textTheme.headline6),
          ),
          ...List.generate(
            10,
            (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                  ),
                  title: Text('Channel Name',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.bold)),
                  subtitle: Text('123k Followers'),
                  trailing: FollowButton(
                    initiallyFollowed: false,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
