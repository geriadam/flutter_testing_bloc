import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing_bloc/blocs/counter_bloc.dart';
import 'package:flutter_testing_bloc/events/counter_event.dart';
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = context.bloc<CounterBloc>();
    return Scaffold(
      body: SafeArea(
          child: BlocBuilder<CounterBloc, int>(
            builder: (context, counter){
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Two action/events", style: TextStyle(fontSize: 25),),
                  Container(
                    child: FlatButton(
                      child: Text("Increment",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      onPressed: () {
                        counterBloc.add(CounterEvent.increment);
                      },
                    ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent
                    ),
                  ),
                  Text('Result : $counter', style: TextStyle(fontSize: 40, color: Colors.blue),),
                  Container(
                    child: FlatButton(
                      child: Text("Decrement",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      onPressed: () {
                        counterBloc.add(CounterEvent.decrement);
                      },
                    ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.redAccent
                    ),
                  )
                ],
              );
            },
          )
      )
    );
  }
}