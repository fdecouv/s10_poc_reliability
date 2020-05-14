import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier{
  static const _users = [
    {
      "id": 0,
      "reliabilityScore": 0
    },
    {
      "id": 1,
      "reliabilityScore": 0
    },
    {
      "id": 2,
      "reliabilityScore": 0
    },
    {
      "id": 3,
      "reliabilityScore": 0
    }
  ];

  User getById(int id){
    return User(id, _users[id]["reliabilityScore"]);
  }

  /// Get item by its position in the catalog.
  User getByPosition(int position) {
  // In this simplified case, an item's position in the catalog
  // is also its id.
    return getById(position);
  }
}

@immutable
class User extends ChangeNotifier{
  UserModel _users;
  final List<int> _usersIds = [];

  UserModel get users => _users;

  set users(UserModel newUser) {
    assert(newUser != null);
    assert(_usersIds.every((id) => newUser.getById(id) != null),
      'The user $newUser does not have one of $_usersIds in it.');
    _users = newUser;

    notifyListeners();
  }

  List<User> get usersList => _usersIds.map((id) => _users.getById(id)).toList();

    void add(User user) {
    _usersIds.add(user.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

    void remove(User user) {
    _usersIds.remove(user.id);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void removeAt(int index) {
    _usersIds.removeAt(index);
    notifyListeners();
  }

  final int id;
  final int reliabilityScore;

  User(this.id, this.reliabilityScore);

  @override
  int get hashCode => id;

  @override
  bool operator == (Object other) => other is User && other.id == id;
}