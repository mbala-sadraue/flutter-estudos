import 'package:flutter/material.dart';
import 'package:state/bloc/user/user.dart';

@immutable
abstract class UserState{}

class UserInitial extends UserState {}

class UserLoadInProgress extends UserState {}

class UserLoadSuccess extends UserState {
  final List<User> users;
  UserLoadSuccess({
    required this.users
  });
}