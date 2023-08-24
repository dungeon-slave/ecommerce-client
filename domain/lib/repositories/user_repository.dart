abstract class UserRepository {
  Future<void> removeUser();
  Future<void> saveUser(String userId);
  bool isUserAuthorized();
}
