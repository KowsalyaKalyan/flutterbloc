import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        home: Scaffold(body: Home()),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _counterbloc = BlocProvider.of<CounterBloc>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('your have push this button this many times:'),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(state.counterValue.toString());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _counterbloc.add(CounterEvent.increment);
                  },
                  child: Text('increment')),
              ElevatedButton(
                  onPressed: () {
                    _counterbloc.add(CounterEvent.increment);
                  },
                  child: Text('increment'))
            ],
          )
        ],
      ),
    );
  }
}
