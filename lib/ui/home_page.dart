import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/widgets/advertisement_banner.dart';
import 'package:video_streaming_mockup/widgets/video_tile.dart';
import 'package:video_streaming_mockup/services/api_service.dart';
import 'package:video_streaming_mockup/model/video.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: APIService.instance.fetchMostPopularVideos(),
      builder: (BuildContext context, AsyncSnapshot<List<Video>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.separated(
              key: PageStorageKey('HomePage'),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(16),
                    child: VideoTile(
                      video: snapshot.data[index],
                    ),
                  ),
              separatorBuilder: (context, index) => AdvertisementBanner());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
