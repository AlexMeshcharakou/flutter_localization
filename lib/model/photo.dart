class Photo {
  static const _keyAlbumId = 'albumId';
  static const _keyId = 'id';
  static const _keyTitle = 'title';
  static const _keyUrl = 'url';
  static const _keyThumbnailUrl = 'thumbnailUrl';

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  Photo.fromJson(Map<String, dynamic> json)
      : albumId = json[_keyAlbumId],
        id = json[_keyId],
        title = json[_keyTitle],
        url = json[_keyUrl],
        thumbnailUrl = json[_keyThumbnailUrl];

  @override
  String toString() {
    return 'Photo: albumId: $albumId, id: $id, title: $title,'
        ' url: $url, thumbnailUrl: $thumbnailUrl';
  }
}
