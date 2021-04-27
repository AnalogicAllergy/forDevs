import 'package:fordev/data/usecases/usecases.dart';
import 'package:fordev/domain/usecases/usecases.dart';
import 'package:fordev/main/factories/http/http.dart';

LoadSurveys makeRemoteLoadSurveys() {
  return RemoteLoadSurveys(
      client: makeHttpAdapter(), url: makeApiUrl('surveys'));
}
