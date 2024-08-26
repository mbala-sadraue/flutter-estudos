import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state/bloc/counter_bloc.dart';
import 'package:state/bloc/user/user_bloc.dart';
import 'package:state/bloc/user/user_state.dart';

import 'bloc/user/user_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({super.key, required this.title});

  final counterBloc = CounterBloc()..add(CounterIncrementPressed());
  final userBloc = UserBloc()..add((UserGetUsersEvent(0)));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<CounterBloc>(create: (context) => counterBloc)],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Center(
            child: Text(
              " Bloc",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
             FloatingActionButton(
              onPressed: () {
                userBloc.add(UserGetUsersEvent(counterBloc.state));
              },
              child: const Icon(Icons.people_alt_outlined),
            ),
            const SizedBox(height: 20,),
            FloatingActionButton(
              onPressed: () {
                counterBloc.add(CounterIncrementPressed());
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                counterBloc.add(CounterDecrementPressed());
              },
              child: const Icon(Icons.remove),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              BlocBuilder(
                bloc: counterBloc,
                builder: (context, countState) => Text(
                  countState.toString(),
                ),
              ),
              BlocBuilder<UserBloc, UserState>(
                bloc: userBloc,
                builder: (context, state){

                  final users = state.users;
                  return Column(
                    children: [
                    if(users.isEmpty  && state.isLoading)
                       const  CircularProgressIndicator(),
                    if(users.isNotEmpty && state.isLoading == false)
                    ...users.map((e) => Text(e.name)),
                    if(users.isEmpty && state.isLoading == false )
                      const Text("Não tem dados")
                    ],
                  );

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}


































// BlocProvider<CounterBloc>(
//       create: (context) =>  counterBloc,
//       child: BlocBuilder<CounterBloc, int>(
//         bloc: counterBloc,
  
//         builder: (context, state) {
//           return Scaffold(
            // body: Center(
            //   child: Text(state.toString()),
            // ),
            // floatingActionButton: Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   // crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     FloatingActionButton(
            //       onPressed: () {
            //         counterBloc.add(CounterIncrementPressed());
            //       },
            //       child: const Icon(Icons.add),
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     FloatingActionButton(
            //       onPressed: () {
            //        counterBloc.add(CounterDecrementPressed());
            //       },
            //       child: const Icon(Icons.remove),
            //     )
            //   ],
            // ),
//           );
//         },
//       ),
//     );