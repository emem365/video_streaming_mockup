class Channel {
  String id;
  String title;
  String thumbnailUrl;
  int viewCount;
  int subscriberCount;
  int videoCount;

  Channel({
    this.id,
    this.title,
    this.thumbnailUrl,
    this.viewCount,
    this.subscriberCount,
    this.videoCount,
  });
  factory Channel.fromMap(Map map) => Channel(
        id: map['id'],
        title: map['snippet']['title'],
        thumbnailUrl: map['snippet']['thumbnails']['default']['url'],
        viewCount: int.parse(map['statistics']['viewCount']),
        subscriberCount: int.parse(map['statistics']['subscriberCount']),
        videoCount: int.parse(map['statistics']['videoCount']),
      );
}
