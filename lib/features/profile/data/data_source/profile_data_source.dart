import 'package:quest_task/core/services/firebase_services/firebase_auth_services.dart';
import 'package:quest_task/core/services/firestore_service.dart';
import 'package:quest_task/features/profile/data/models/user_model.dart';

abstract class ProfileDataSource {
  Future<UserModel> getUserData(String userId);
  Future<void> signOut();
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final FirestoreService<UserModel> _userService;
  final FirebaseAuthServices _authService;

  ProfileDataSourceImpl({
    required FirestoreService<UserModel> userService,
    required FirebaseAuthServices authService,
  })  : _userService = userService,
        _authService = authService;

  @override
  Future<UserModel> getUserData(String userId) async {
    final user = await _userService.get(userId);
    if (user == null) {
      throw Exception('User not found');
    }
    return user;
  }

  @override
  Future<void> signOut() async {
    await _authService.signOut();
  }
} 