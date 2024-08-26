import 'package:flutter/material.dart';
import 'package:state/bloc/user/user.dart';

@immutable
 class UserState{

  final List<User>users;
  final List<Job> jobs;
  final bool isLoading;

  const UserState({
     this.users = const [],
     this.jobs = const [],
     this.isLoading = false
  });

  UserState copyWith({List<User>?users,List<Job>? jobs, bool? isLoading}){

    return UserState( 
      users: users?? this.users,
      jobs: jobs?? this.jobs,
      isLoading:  isLoading ?? this.isLoading
    );
  }
}

class UserInitial extends UserState {}

class UserLoadInProgress extends UserState {}

class UserLoadSuccess extends UserState {
  
   const UserLoadSuccess({
  required users
  }):super(users: users);
}