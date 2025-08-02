import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newstrack/logic/bloc/news_event.dart';
import 'package:newstrack/logic/bloc/news_state.dart';
import 'package:newstrack/model/newsmodel.dart';
import 'package:newstrack/service/api_service.dart';
import 'package:newstrack/utill/app_const.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiService apiService;

  NewsBloc({required this.apiService}) : super(InitialState()) {
    on<FetchNewsEvent>((event, emit) async {
      emit(LodingState());
      try {
        final jsonData = await apiService.getNews(AppConst.apiUrl);
        NewsModel newsModel = NewsModel.fromJson(jsonData);
        emit(LoadedState(newsModel: newsModel));
      } catch (e) {
        emit(FailedState(errorMessage: e.toString()));
      }
    });
  }
}
