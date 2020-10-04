import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'User.dart';

part 'UserState.freezed.dart';


@freezed
abstract class UsersState with _$UsersState{
  const factory UsersState({
    @Default(<User>[]) List<User> users,
  }) = _UsersState;
}

class UsersController extends StateNotifier<UsersState> {
  UsersController(UsersState initialUserList) : super(initialUserList ?? []);

  void addUser(String newName, String newText) {
    state = state.copyWith(users: [...state.users, User(name: newName, text: newText)]);
  }

  // List<Widget> get() {
  //   return [
  //     for (final user in state)
  //       Text(
  //         "name:" + user.user + "\n" + "text:" + user.text
  //       ),
  //   ];
  // }
}