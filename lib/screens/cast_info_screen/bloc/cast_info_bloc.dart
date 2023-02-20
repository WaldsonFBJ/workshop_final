import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/fetch_cast_details.dart';
import '../../../models/cast_info_model.dart';
import '../../../models/error_model.dart';
import '../../../models/movie_model.dart';
import '../../../models/tv_model.dart';

part 'cast_info_event.dart';
part 'cast_info_state.dart';

class CastInfoBloc extends Bloc<CastInfoEvent, CastInfoState> {
  final FetchCastInfoById repo = FetchCastInfoById();

  CastInfoBloc() : super(CastInfoInitial()) {
    on<CastInfoEvent>((event, emit) async {
      if (event is LoadCastInfo) {
        try {
          emit(CastInfoLoading());
          final data = await repo.getCastDetails(event.id);

          emit(CastInfoLoaded(
            info: data[0],
            movies: data[3],
            socialInfo: data[1],
            images: data[2],
            tvShows: data[4],
          ));
        } on FetchDataError catch (e) {
          emit(CastInfoError(error: e));
        } catch (e) {
          emit(CastInfoError(error: FetchDataError(e.toString())));
        }
      }
    });
  }
}
