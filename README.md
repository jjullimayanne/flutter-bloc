

### What is Bloc? 
#### Bloc means Business Logic Component, had been created to separate the business rules from the user interface 

### A reactive app 

#### An application reactive is based on streams, which means a data flow. A flow can be observed on any screen in your code

### What do we need? 

#### StreamController 
That will control your flow, here we can add data, read data, change data, etc


#### Observable/Stream 
Here our data will be observable, which means our data flow will be out here. 



### Get your hands dirty

First of all, we need to install `bloc_pattern` on our project 

Then fore our `MyBloc`

~~~dart

class MyBloc{

}

~~~


Now we needs to create a controller, that will literally have the flow control:

~~~dart

class MyBloc{
   final blocController = StreamController<int>();
}

~~~

We also needs to create our screen


~~~dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ScreenBlocApp extends StatefulWidget {
  const ScreenBlocApp({super.key});

  @override
  State<ScreenBlocApp> createState() => _ScreenBlocAppState();
}

class _ScreenBlocAppState extends State<ScreenBlocApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


~~~


Now, we can implemenst on bloc our business rules, is a simple one our app will just increment a value when our button is clicked
~~~dart

class MyBloc {
  int total = 0;

  final blocController = StreamController<int>();

  void increment() {
    total++;
    blocController.sink.add(total);
  }

  close() {
    blocController.close();
  }
}

~~~

Finished our bloc, now we need to listen on our screen to the blocs Flow, creating a new instance of our `MyBloc` class  
then call a `StreamBuilder` widget and in the stream we call our `bloc` new instance 

~~~dart

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import '../bloc/bloc.dart';

class ScreenBlocApp extends StatefulWidget {
  const ScreenBlocApp({super.key});

  @override
  State<ScreenBlocApp> createState() => _ScreenBlocAppState();
}

class _ScreenBlocAppState extends State<ScreenBlocApp> {
  MyBloc bloc = MyBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Using Bloc'),
          ),
          body: Center(
            child: Column(children: [
              StreamBuilder<int>(
                stream: bloc.blocController.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return Container();
                },
              )
            ]),
          ),
        );
      },
    );
  }
}


~~~

We can also create a button and an initial value that should be update with our bloc rule

~~~dart

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import '../bloc/bloc.dart';

class ScreenBlocApp extends StatefulWidget {
  const ScreenBlocApp({super.key});

  @override
  State<ScreenBlocApp> createState() => _ScreenBlocAppState();
}

class _ScreenBlocAppState extends State<ScreenBlocApp> {
  MyBloc bloc = MyBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Using Bloc'),
          ),
          body: Center(
            child: Column(children: [
              StreamBuilder<int>(
                stream: bloc.blocController.stream,
                initialData: 0,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return Text('${snapshot.data}');
                },
              ),
              const SizedBox(
                height: 300,
              ),
              TextButton(
                  onPressed: () {
                    bloc.increment();
                  },
                  child: const Text('Click here to update the value'))
            ]),
          ),
        );
      },
    );
  }
}



~~~

And now we have a state update with a bloc pattern

https://github.com/jjullimayanne/flutter-bloc/assets/79465402/c5e190ba-0487-45de-98b4-7233f2c4448d















