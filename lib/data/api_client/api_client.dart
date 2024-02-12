import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:search_filter_example/data/models/anime_title.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://api.jikan.moe/v4/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/anime')
  Future<AnimeSearchResponse> getAnimeTitle(@Query('q') String title);
}
