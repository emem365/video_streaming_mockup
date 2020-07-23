import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/ui/app_screen.dart';

class CoinsPage extends StatelessWidget {
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
          'Coins',
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
            child: Row(
              children: <Widget>[
                Text('Balance', style: Theme.of(context).textTheme.bodyText2),
                Spacer(),
                Text('1,500', style: Theme.of(context).textTheme.headline6),
                Text(' coins',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text('ADD COINS'),
                      ),
                      color: Colors.blue,
                      textColor: Colors.white),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: RaisedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text('WITHDRAW MONEY'),
                      ),
                      color: Colors.blue,
                      textColor: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 0, 0),
            child: Text('Send Coins to',
                style: Theme.of(context).textTheme.bodyText2),
          ),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                    radius: 30, child: Icon(Icons.person, color: Colors.blue)),
                CircleAvatar(
                    radius: 30, child: Icon(Icons.person, color: Colors.blue)),
                CircleAvatar(
                    radius: 30, child: Icon(Icons.person, color: Colors.blue)),
                CircleAvatar(
                    radius: 30, child: Icon(Icons.add, color: Colors.blue)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 0, 0),
            child:
                Text('History', style: Theme.of(context).textTheme.bodyText2),
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
                  trailing:
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Text(_ % 2 == 0 ? '-1,500' : '+500',
                        style: Theme.of(context).textTheme.headline6),
                    Text(' coins',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontWeight: FontWeight.w400)),
                  ])),
            ),
          ),
        ],
      ),
    );
  }
}
