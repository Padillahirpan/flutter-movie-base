enum MovieListCategories { nowPlaying, popular, topRated, upcoming }

class GetMovieListParam {
  final MovieListCategories category;
  final int page;

  GetMovieListParam({required this.category, this.page = 1});

  @override
  String toString() {
    return 'GetMovieListParam(category: $category, page: $page)';
  }
}
