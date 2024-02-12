import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_filter_example/data/api_client/api_client.dart';
import 'package:search_filter_example/features/search/bloc/search_bloc.dart';
import 'package:search_filter_example/home_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final apiClient = ApiClient(Dio());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(apiClient: apiClient),
        ),
      ],
      child: const MaterialApp(
        home: Scaffold(body: SafeArea(child: HomeScreen())),
      ),
    );
  }
}
