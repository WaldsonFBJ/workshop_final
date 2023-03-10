part of 'season_detail_bloc.dart';

abstract class SeasonDetailEvent extends Equatable {
  const SeasonDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadSeasonInfo extends SeasonDetailEvent {
  final String id;
  final String sNum;
  const LoadSeasonInfo({
    required this.id,
    required this.sNum,
  });
}
