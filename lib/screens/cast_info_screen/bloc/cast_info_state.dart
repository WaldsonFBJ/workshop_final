part of 'cast_info_bloc.dart';

abstract class CastInfoState extends Equatable {
  const CastInfoState();

  @override
  List<Object> get props => [];
}

class CastInfoInitial extends CastInfoState {}

class CastInfoLoaded extends CastInfoState {
  final CastPersonalInfo info;
  final SocialMediaInfo socialInfo;
  final List<TvModel> tvShows;
  final List<ImageBackdrop> images;
  final List<MovieModel> movies;
  const CastInfoLoaded({
    required this.info,
    required this.socialInfo,
    required this.tvShows,
    required this.images,
    required this.movies,
  });
}

class CastInfoLoading extends CastInfoState {}

class CastInfoError extends CastInfoState {
  final FetchDataError error;
  const CastInfoError({
    required this.error,
  });
}
