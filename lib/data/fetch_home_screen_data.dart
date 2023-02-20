import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieinfo/api/key.dart';

import '../models/movie_model.dart';
import '../models/tv_model.dart';

class FetchHomeRepo {
  Future<List<dynamic>> getHomePageMovies() async {
    MovieModelList trendingData;
    MovieModelList nowPlayingData;
    MovieModelList topRatedData;
    MovieModelList upcomingData;
    TvModelList tvShowData;
    TvModelList topRatedTvData;

    final response = await http.get(
      Uri.parse(BASE_URL + '/home'),
    );
    if (response.statusCode == 200) {
      trendingData =
          MovieModelList.fromJson(json.decode(response.body)['Filmes em alta']);
      nowPlayingData = MovieModelList.fromJson(
          json.decode(response.body)['Filmes passando agora']);
      topRatedData =
          MovieModelList.fromJson(json.decode(response.body)['Filmes com as melhores notas']);
      upcomingData =
          MovieModelList.fromJson(json.decode(response.body)['Lançamentos']);
      tvShowData =
          TvModelList.fromJson(json.decode(response.body)['Series em alta']);
      topRatedTvData =
          TvModelList.fromJson(json.decode(response.body)['Series com as melhores notas']);
      return [
        trendingData.movies,
        nowPlayingData.movies,
        topRatedData.movies,
        upcomingData.movies,
        tvShowData.movies,
        topRatedTvData.movies
      ];
    } else {
      throw Exception('Falha ao carregar os dados');
    }
  }
}
