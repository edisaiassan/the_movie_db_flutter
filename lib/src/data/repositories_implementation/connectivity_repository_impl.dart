import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:the_movie_db/src/data/services/remote/internet_checker.dart';
import 'package:the_movie_db/src/domain/repositories/connectivity_repository.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  ConnectivityRepositoryImpl(this._connectivity, this._internetChecker);
  final Connectivity _connectivity;
  final InternetChecker _internetChecker;

  @override
  Future<bool> get hasInternet async {
    final result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      return false;
    }

    return _internetChecker.hasInternet();
  }
}