import 'dart:convert';

import 'package:http/http.dart' as http;
import '../api/key.dart';
import '../models/cast_info_model.dart';
import '../models/error_model.dart';
import '../models/movie_model.dart';
import '../models/tv_model.dart';

class FetchCastInfoById {
  Future<List<dynamic>> getCastDetails(String id) async {
    CastPersonalInfo prInfo;
    SocialMediaInfo socialMedia;
    ImageBackdropList backdrops;
    MovieModelList movies;
    TvModelList tv;
    var response = await http.get(Uri.parse('$BASE_URL/pessoa/$id'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      prInfo = CastPersonalInfo.fromJson(data['data']);
      socialMedia = SocialMediaInfo.fromJson(data['socialmedia']);
      backdrops = ImageBackdropList.fromJson(data['images']['profiles']);

      movies = MovieModelList.fromJson(data['movies']['cast']);
      tv = TvModelList.fromJson(data['tv']['cast']);

      return [
        prInfo,
        socialMedia,
        backdrops.backdrops,
        movies.movies,
        tv.movies,
      ];
    } else {
      throw FetchDataError('Falha ao buscar os dados');
    }
  }
}
