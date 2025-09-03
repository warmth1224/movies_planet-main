import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/network/api_constants.dart';
import 'package:movies_planet/presentation/widgets/mp_overview_section.dart';
import 'package:movies_planet/presentation/widgets/mp_section_list_view.dart';
import 'package:movies_planet/presentation/widgets/mp_section_list_view_card.dart';
import 'package:movies_planet/resources/mp_colors.dart';
import 'package:movies_planet/resources/mp_routes.dart';
import 'package:movies_planet/resources/mp_values.dart';

import '../presentation/widgets/mp_section_title.dart';
import '../resources/mp_strings.dart';

String getDate(String? date) {
  if (date == null || date.isEmpty) {
    return '';
  }
  final value = date.split('-');
  String year = value[0];
  int getMonthThroughValue = int.parse(value[1]);
  String day = value[2];
  String month = '';

  switch (getMonthThroughValue) {
    case 1:
      month = 'Jan';
      break;
    case 2:
      month = 'Feb';
      break;
    case 3:
      month = 'Mar';
      break;
    case 4:
      month = 'Apr';
      break;
    case 5:
      month = 'May';
      break;
    case 6:
      month = 'Jun';
      break;
    case 7:
      month = 'Jul';
      break;
    case 8:
      month = 'Aug';
      break;
    case 9:
      month = 'Sep';
      break;
    case 10:
      month = 'Oct';
      break;
    case 11:
      month = 'Nov';
      break;
    case 12:
      month = 'Dec';
      break;
    default:
      break;
  }
  return '$month $day,$year';
}

String getPosterUrl(String? path) {
  if (path != null) {
    return MpApi.basePosterUrl + path;
  } else {
    return MpApi.moviePlaceHolder;
  }
}

Widget overViewSection(String overview) {
  return overview.isNotEmpty
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MPSectionTitle(
              title: MPStrings.story,
            ),
            MPOverViewSection(overView: overview),
          ],
        )
      : const SizedBox();
}

String getVotesCount(int voteCount) {
  if (voteCount < 1000) {
    return '($voteCount)';
  }
  return '(${voteCount ~/ 1000}k)';
}

String getBackdropUrl(String? path) {
  if (path != null) {
    return MpApi.baseBackdropUrl + path;
  } else {
    return MpApi.moviePlaceHolder;
  }
}

String getAvatarUrl(String? path) {
  return path != null
      ? path.startsWith('/https://www.gravatar.com/avatar')
          ? path.substring(1)
          : MpApi.baseAvatarUrl + path
      : MpApi.avatarPlaceHolder;
}

String getStillUrl(String? path) {
  if (path != null) {
    return MpApi.baseStillUrl + path;
  } else {
    return MpApi.stillPlaceHolder;
  }
}

String getLength(int? runtime) {
  if (runtime == null || runtime == 0) {
    return '';
  }
  if (runtime < 60) {
    return '${runtime}m';
  }
  if (runtime % 60 == 0) {
    return '${runtime ~/ 60}h';
  }
  return '${runtime ~/ 60}h ${runtime % 60}m';
}

String getVoteCount(int vote) {
  if (vote < 1000) {
    return '($vote)';
  } else {
    return "({$vote ~/ 1000}k)";
  }
}

String getGenres(List<dynamic> genres) {
  if (genres.isNotEmpty) {
    return genres.first['name'];
  } else {
    return '';
  }
}

String getTrailerUrl(Map<String, dynamic> json) {
  List videos = json['videos']['results'];
  if (videos.isNotEmpty) {
    List trailers =
        videos.where((element) => element['type'] == 'Trailer').toList();
    if (trailers.isNotEmpty) {
      return MpApi.baseVideoUrl + trailers.last['key'];
    } else {
      return '';
    }
  } else {
    return '';
  }
}

String getProfileImageUrl(Map<String, dynamic> json) {
  if (json['profile_path'] != null) {
    return MpApi.baseProfileUrl + json['profile_path'];
  } else {
    return MpApi.castPlaceHolder;
  }
}

String getElapsedTime(String time) {
  DateTime reviewDate = DateTime.parse(time);
  DateTime today = DateTime.now();
  Duration diff = today.difference(reviewDate);
  int years = diff.inDays ~/ 365;
  int months = diff.inDays ~/ 30;
  int weeks = diff.inDays ~/ 7;
  int hours = diff.inHours ~/ 24;
  int minutes = diff.inMinutes ~/ 60;

  if (diff.inDays >= 365) {
    return '${years}y';
  } else if (diff.inDays >= 30) {
    return '${months}mo';
  } else if (diff.inDays >= 7) {
    return '${weeks}w';
  } else if (diff.inDays >= 1) {
    return '${diff.inDays}d';
  } else if (diff.inHours >= 1) {
    return '${hours}h';
  } else if (diff.inMinutes >= 1) {
    return '${minutes}min';
  } else {
    return 'Now';
  }
}

void navigateToDetailView(BuildContext context, MpMedia media) {
  media.isMovie
      ? context.pushNamed(MPRoutes.movieDetailsRoute,
          pathParameters: {'movieId': media.tmdbID.toString()})
      : context.pushNamed(MPRoutes.tvShowDetailsRoute,
          pathParameters: {'tvShowId': media.tmdbID.toString()});
}

void mpBottomSheet(BuildContext context, Widget child) {
  final size = MediaQuery.of(context).size.height;
  showModalBottomSheet(
      context: context,
      backgroundColor: MPColors.secondaryBackground,
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(MPSize.size20))),
      builder: (context) => SizedBox(
            height: size * .5,
            child: child,
          ));
}

Widget similarMediaSection(List<MpMedia>? similar) {
  return similar != null && similar.isNotEmpty
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MPSectionTitle(title: MPStrings.similar),
            MPSectionListView(
                itemCount: similar.length,
                height: MPSize.size240,
                itemBuilder: (context, index) =>
                    MPSectionListViewCard(mpMedia: similar[index]))
          ],
        )
      : const SizedBox();
}
