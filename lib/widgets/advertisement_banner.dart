import 'package:flutter/material.dart';

class AdvertisementBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      elevation: 0,
      child: SizedBox(
        width: double.infinity,
        height: 75,
        child: ListTile(
          title: Text('Advertisement'),
          subtitle: Row(
            children: <Widget>[
              Text('www.site.com'),
              SizedBox(
                width: 20,
              ),
              Text(
                ' Sponsored ',
                style:
                    TextStyle(backgroundColor: Colors.yellow, fontSize: 12.0),
              )
            ],
          ),
          trailing: RaisedButton(
            color: Colors.white,
            onPressed: () {},
            child: Text(
              'OPEN',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}
