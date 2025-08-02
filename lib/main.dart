import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newstrack/logic/bloc/news_bloc.dart';
import 'package:newstrack/service/api_service.dart';
import 'package:newstrack/ui/screens/home_screen.dart';
import 'package:newstrack/utill/theming/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NewsBloc>(
              create: (context) => NewsBloc(apiService: ApiService()))
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            home: HomeScreen()));
  }
}
