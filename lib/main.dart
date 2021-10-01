import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_timer/timer_hook.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageHook3(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer timer;
  int _number = 0;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _number = timer.tick;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hooks in Flutter'),
      ),
      body: Center(
        child: Center(
          child: Text(
            '$_number',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}

class HomePageHook extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _numberNotifier = useState(0);

    useEffect(
      () {
        final timer = Timer.periodic(Duration(seconds: 1), (timer) {
          _numberNotifier.value = timer.tick;
        });
        return timer.cancel;
      },
      const [],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Hooks in Flutter'),
      ),
      body: Center(
        child: Center(
          child: Text(
            '${_numberNotifier.value}',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}

class HomePageHook2 extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final int number = useInfiniteTimer(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hooks in Flutter'),
      ),
      body: Center(
        child: Center(
          child: Text(
            '$number',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}

class HomePageHook3 extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final int number = useInfiniteTimer(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hooks in Flutter'),
      ),
      body: Center(
        child: Center(
          child: Text(
            '$number',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
