import 'package:movies_planet/data/model/mp_review.dart';
import 'package:movies_planet/utils/mp_functions.dart';

class ReviewModel extends MpReview {
  const ReviewModel(
      {required super.authorName,
      required super.authorUserName,
      required super.avatarUrl,
      required super.rating,
      required super.content,
      required super.elapsedTime});
  factory ReviewModel.fromMap(Map<String, dynamic> json) {
    return ReviewModel(
        authorName: json['author'],
        authorUserName: '@${json['author_details']['username']}',
        avatarUrl: getAvatarUrl(json['author_details']['avatar_path']),
        rating: json['author_details']['rating'] != null
            ? json['author_details']['rating'] / 2
            : -1,
        content: json['content'],
        elapsedTime: getElapsedTime(json['created_at']));
  }
}
