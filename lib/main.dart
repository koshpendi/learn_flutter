import 'package:flutter/material.dart';
import 'package:flutter_application_1/counter_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(myApp());
}

Widget myApp() {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        )
      ],
      child: const MyHomePage(title: 'App name'),
    ),
  );
}

class MyHomePage extends HookWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var counter = useState(0);
    // final incrementCounter = useCallback(() => counter.value++, [counter]);
    return home(
        title: title,
        onIncrement: context.read<CounterProvider>().increment);
  }
}

Widget home(
    {String title = 'home',
    required final onIncrement}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          renderCount()
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: onIncrement,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ), // This trailing comma makes auto-formatting nicer for build methods.
  );
}

Widget renderCount() {
  return Consumer<CounterProvider>(
      builder: (context, count, child) => Text(count.value.toString()));
}
