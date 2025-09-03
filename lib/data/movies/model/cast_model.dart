
import '../../../utils/mp_functions.dart';
import '../../model/mp_cast.dart';

class CastModel extends MpCast {
  const CastModel({
    required super.name,
    required super.profileUrl,
    required super.gender,
  });

  factory CastModel.fromMap(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'],
      profileUrl: getProfileImageUrl(json),
      gender: json['gender'],
    );
  }
}