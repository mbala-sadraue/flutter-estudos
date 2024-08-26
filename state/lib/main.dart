import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state/bloc/counter_bloc.dart';

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
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
   MyHomePage({super.key, required this.title});
  
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {

          final counterBloc = BlocProvider.of<CounterBloc>(context); 

          return Scaffold(
            body: Center(
              child: Text(state.toString()),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
          );
        },
      ),
    );
  }
}
