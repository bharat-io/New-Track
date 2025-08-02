import 'package:http/http.dart';
import 'package:newstrack/model/newsmodel.dart';

abstract class NewsState {}

class InitialState extends NewsState {}

class LodingState extends NewsState {}

class LoadedState extends NewsState {
  NewsModel newsModel;
  LoadedState({required this.newsModel});
}

class FailedState extends NewsState {
  String errorMessage;
  FailedState({required this.errorMessage});
}
