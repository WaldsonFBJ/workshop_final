import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../api/key.dart';
import '../models/error_model.dart';
import '../models/movie_model.dart';

class FetchMovieDataById {
  Future<List<dynamic>> getDetails(String id) async {
    MovieInfoModel movieData;
    MovieInfoImdb imdbData;
    TrailerList trailersData;
    ImageBackdropList backdropsData;
    CastInfoList castData;
    MovieModelList similarData;
    var images = [];
    dynamic movie;
    var response = await http.get(Uri.parse('$BASE_URL/filme/$id'));
    if (response.statusCode == 200) {
      movie = jsonDecode(response.body);
    } else {
      throw FetchDataError('Algo deu errado!');
    }

    movieData = MovieInfoModel.fromJson(movie['data']);
    trailersData = TrailerList.fromJson(movie['videos']);
    images.addAll(movie['images']['backdrops']);
    images.addAll(movie['images']['posters']);
    images.addAll(movie['images']['logos']);

    backdropsData = ImageBackdropList.fromJson(images);

    castData = CastInfoList.fromJson(movie['credits']);
    similarData = MovieModelList.fromJson(movie['similar']['results']);

    var imdbId = movieData.imdbid;
    final imdbResponse =
        await http.get(Uri.parse('$BASE_URL/filme/imdb/' + imdbId.toString()));
    if (imdbResponse.statusCode == 200) {
      imdbData = MovieInfoImdb.fromJson(jsonDecode(imdbResponse.body)['data']);
    } else {
      throw FetchDataError('Erro buscando dados');
    }
    return [
      movieData,
      trailersData.trailers,
      backdropsData.backdrops,
      castData.castList,
      imdbData,
      similarData.movies,
    ];
  }
}
