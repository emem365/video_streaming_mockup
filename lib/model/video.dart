class Video {
  String id;
  DateTime publishedAt;
  String channelId;
  String title;
  String thumbnailUrl;
  String channelTitle;
  String categoryId;
  int views;

  Video({
    this.id,
    this.publishedAt,
    this.channelId,
    this.title,
    this.thumbnailUrl,
    this.channelTitle,
    this.categoryId,
    this.views,
  });

  factory Video.fromMap(Map map) => Video(
        id: map['id'],
        publishedAt: DateTime.parse(map['snippet']['publishedAt']),
        channelId: map['snippet']['channelId'],
        title: map['snippet']['title'],
        thumbnailUrl: map['snippet']['thumbnails']['standard']!=null? map['snippet']['thumbnails']['standard']['url']: map['snippet']['thumbnails']['default']['url'],
        channelTitle: map['snippet']['channelTitle'],
        categoryId: map['snippet']['categoryId'],
        views: map['statistics'] == null
            ? null
            : int.parse(map['statistics']['viewCount']),
      );
}
