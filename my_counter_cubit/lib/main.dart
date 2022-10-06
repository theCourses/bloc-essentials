import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_cubit/cubits/counter/counter_cubit.dart';
import 'package:my_counter_cubit/other_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'MyCounter Cubit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(),
      ),
    );
  }
}

// THis is the simplest way to use cubits
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               FloatingActionButton(
//                 onPressed: () {
//                   BlocProvider.of<CounterCubit>(context).decrement();
//                 },
//                 heroTag: 'decrement',
//                 child: const Icon(Icons.remove),
//               ),
//               Text(
//                 '${BlocProvider.of<CounterCubit>(context, listen: true).state.counter}',
//                 style: const TextStyle(fontSize: 52.0),
//               ),
//               FloatingActionButton(
//                 onPressed: () {
//                   BlocProvider.of<CounterCubit>(context).increment();
//                 },
//                 heroTag: 'increment',
//                 child: const Icon(Icons.add),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.counter == 3) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        content: Text('counter is ${state.counter}'));
                  });
            } else if (state.counter == -1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const OtherPage();
              }));
            }
          },
          builder: (context, state) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    heroTag: 'decrement',
                    child: const Icon(Icons.remove),
                  ),
                  Text(
                    '${state.counter}',
                    style: const TextStyle(fontSize: 52.0),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    heroTag: 'increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
