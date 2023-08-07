// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Video {
  final String title;
  final String video_link;
  final String summary;
  final DateTime created_at;
  Video({
    required this.title,
    required this.video_link,
    required this.summary,
    required this.created_at,
  });

  Video copyWith({
    String? title,
    String? video_link,
    String? summary,
    DateTime? created_at,
  }) {
    return Video(
      title: title ?? this.title,
      video_link: video_link ?? this.video_link,
      summary: summary ?? this.summary,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'video_link': video_link,
      'summary': summary,
      'created_at': created_at.millisecondsSinceEpoch,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      title: map['title'] as String,
      video_link: map['video_link'] as String,
      summary: map['summary'] as String,
      created_at: DateTime.parse(map['created_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) =>
      Video.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Video(title: $title, video_link: $video_link, summary: $summary, created_at: $created_at)';
  }

  @override
  bool operator ==(covariant Video other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.video_link == video_link &&
        other.summary == summary &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        video_link.hashCode ^
        summary.hashCode ^
        created_at.hashCode;
  }
}
