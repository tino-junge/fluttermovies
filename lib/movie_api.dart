import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models.dart';

main() {
  getMovies();
}

Future<Stream<Movie>> getMovies() async {
  var apiKey = '<YOUR_API_KEY>';
  var apiUrl = 'https://api.themoviedb.org/3/discover/movie';
  var params =
      '?primary_release_date.gte=2018-03-15&primary_release_date.lte=2018-04-07';
  var url = apiUrl + params + '&api_key=' + apiKey;

  var client = new http.Client();
  var streamedRes = await client.send(new http.Request('get', Uri.parse(url)));

  return streamedRes.stream
      .transform(UTF8.decoder)
      .transform(JSON.decoder)
      .expand((jsonBody) => (jsonBody as Map)['results'])
      .map((jsonMovie) => new Movie.fromJson(jsonMovie));
}
