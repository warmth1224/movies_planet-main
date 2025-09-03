import 'package:movies_planet/data/movies/model/movies_model.dart';
import 'package:movies_planet/data/movies/model/movies_detail_model.dart';


abstract class MpRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> getAllPopularMovies(int movieId);
  Future<List<MovieModel>> getAllTopRatedMovies(int page);
  Future<List<List<MovieModel>>> getMovies();
  Future<MoviesDetailModel> getMovieDetail(int movieId);
}
