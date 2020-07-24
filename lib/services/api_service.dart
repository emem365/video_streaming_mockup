import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:video_streaming_mockup/util/keys.dart';
import 'package:video_streaming_mockup/model/video.dart';
import 'package:video_streaming_mockup/model/channel.dart';

class APIService {
  APIService._instantiate();

  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'www.googleapis.com';

  Future<List<Video>> fetchMostPopularVideos({
    String categoryId,
    int maxResults = 10,
    String regionCode = 'in',
  }) async {
    Map<String, String> parameters = {
      'part': 'id, snippet, statistics',
      'chart': 'mostPopular',
      'maxResults': maxResults.toString(),
      'regionCode': regionCode,
      if (categoryId != null) 'videoCategoryId': categoryId,
      'key': API_KEY,
    };

    Uri uri = Uri.https(_baseUrl, '/youtube/v3/videos', parameters);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      List data = json.decode(response.body)['items'];  
      List<Video> videos = data.map((item) => Video.fromMap(item)).toList();
      return videos;
    } else {
      return Future.error(json.decode(response.body)['error']['message']);
    }
  }

  Future<List<Video>> fetchVideosFromChannelId(String channelId, {int maxCount=10}) async {
    Map<String, String> channelRequestParameters = {
      'part': 'contentDetails',
      'id': channelId,
      'key': API_KEY,
    };

    Uri channelRequestUri =
        Uri.https(_baseUrl, '/youtube/v3/channels', channelRequestParameters);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    var response = await http.get(channelRequestUri, headers: headers);
    if (response.statusCode == 200) {
      String playlistId = json
          .decode(response.body)['items']
          .first['contentDetails']['relatedPlaylists']['uploads'];
      Map<String, String> playlistRequestParameters = {
        'part': 'snippet',
        'maxResults': maxCount.toString(),
        'playlistId': playlistId,
        'key': API_KEY,
      };

      Uri playlistRequestUri = Uri.https(
          _baseUrl, '/youtube/v3/playlistItems', playlistRequestParameters);

      var playlistResponse =
          await http.get(playlistRequestUri, headers: headers);
      if (playlistResponse.statusCode == 200) {
        List data = json.decode(playlistResponse.body)['items'];
        
        List<Video> videos = data.map((item) => Video.fromMap(item)).toList();
        print(videos);
        return videos;
      } else {
        return Future.error(json.decode(response.body)['error']);
      }
    } else {
      return Future.error(json.decode(response.body)['error']['message']);
    }
  }

  Future<Channel> fetchChannelFromId(String id) async {
    Map<String, String> parameters = {
      'part': 'snippet, statistics',
      'id': id,
      'key': API_KEY,
    };

    Uri uri = Uri.https(_baseUrl, '/youtube/v3/channels', parameters);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)['items'][0];
      Channel channel = Channel.fromMap(data);
      return channel;
    } else {
      return Future.error(json.decode(response.body)['error']['message']);
    }
  }
}
