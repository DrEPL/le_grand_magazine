import 'dart:convert';

class Video {
  final String? title;
  final String video_link;
  final DateTime created_at;
  Video({
    this.title,
    required this.video_link,
    required this.created_at,
  });

  Video copyWith({
    String? title,
    String? video_link,
    DateTime? created_at,
  }) {
    return Video(
      title: title ?? this.title,
      video_link: video_link ?? this.video_link,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'video_link': video_link,
      'created_at': created_at.millisecondsSinceEpoch,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      title: map['title'],
      video_link: map['video_link'] ?? '',
      created_at: DateTime.parse(map['created_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) => Video.fromMap(json.decode(source));

  @override
  String toString() => 'Video(title: $title, video_link: $video_link, created_at: $created_at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Video &&
      other.title == title &&
      other.video_link == video_link &&
      other.created_at == created_at;
  }

  @override
  int get hashCode => title.hashCode ^ video_link.hashCode ^ created_at.hashCode;
}
