import 'package:flutter/material.dart';
import 'counter_bloc_home.dart';

class BolcDemo extends StatelessWidget {
  const BolcDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBLoC(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlocDemo'),
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}
