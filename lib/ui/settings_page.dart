import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/ui/app_screen.dart';

class SettingsPage extends StatelessWidget {
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
          'Settings',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.w300, fontSize: 20.0),
        ),
        centerTitle: true,
        leading: BackButton(),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.list),
              title: Text('General'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.lock),
              title: Text('Privacy and Security'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.brightness_high),
              title: Text('Change to Dark Mode'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Billing & Payments'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('About'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log out'),
            ),
          ),
        ],
      ),
    );
  }
}
