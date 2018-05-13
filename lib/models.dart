class Movie {
  Movie({
    this.bannerUrl,
    this.posterUrl,
    this.title,
    this.rating,
    this.starRating,
    this.storyline,
  });

  final String bannerUrl;
  final String posterUrl;
  final String title;
  final double rating;
  final int starRating;
  final String storyline;

  // Based on themoviedb API v3
  static final posterImgUrl = 'https://image.tmdb.org/t/p/w200';
  static final bannerImgUrl = 'https://image.tmdb.org/t/p/w300';
  Movie.fromJson(Map jsonMap)
      : title = jsonMap['title'],
        rating = jsonMap['vote_average'],
        starRating = (jsonMap['vote_average'] / 2).round().toInt(),
        posterUrl = posterImgUrl + jsonMap['poster_path'],
        bannerUrl = bannerImgUrl + jsonMap['backdrop_path'],
        storyline = jsonMap['overview'];
}

class Actor {
  Actor({
    this.name,
    this.avatarUrl,
  });

  final String name;
  final String avatarUrl;
}
