import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _key = 'session_id';

class SessionService {
  final FlutterSecureStorage _secureStorage;

  SessionService(this._secureStorage);

  Future<String?> get sessionId async {
    final sessionId = await _secureStorage.read(key: _key);
    return sessionId;
  }

  Future<void> saveSessionid(String sessionId) async {
    return _secureStorage.write(
      key: _key,
      value: sessionId,
    );
  }

  Future<void> signOut() {
    return _secureStorage.delete(key: _key);
  }
}
