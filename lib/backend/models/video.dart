import 'dart:convert';

class Video {
  final String title;
  final String? thumbnail;
  final String url;
  Video({
    required this.title,
    this.thumbnail,
    required this.url,
  });

  Video copyWith({
    String? title,
    String? thumbnail,
    String? url,
  }) {
    return Video(
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'thumbnail': thumbnail,
      'url': url,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      title: map['title'] ?? '',
      thumbnail: map['thumbnail'],
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) => Video.fromMap(json.decode(source));

  @override
  String toString() => 'Video(title: $title, thumbnail: $thumbnail, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Video &&
      other.title == title &&
      other.thumbnail == thumbnail &&
      other.url == url;
  }

  @override
  int get hashCode => title.hashCode ^ thumbnail.hashCode ^ url.hashCode;
}
