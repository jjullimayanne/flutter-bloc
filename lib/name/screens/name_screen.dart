import 'package:bloc_project/screens/name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameContainer extends StatelessWidget {
  const NameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NameCubit("Julli"),
      child: const NameView(),
    );
  }
}

class NameView extends StatefulWidget {
  const NameView({super.key});

  @override
  State<NameView> createState() => _NameViewState();
}

class _NameViewState extends State<NameView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    final TextTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name"),
      ),
      // body: BlocBuilder<CounterCubit, int>(
      //   builder: (context, state) {
      //     return Center(
      //       child: Text("$state"),
      //     );
      //   },
      // ),
      //Center(child: Text("0")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              labelText: "Desired Name",
            ),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          TextButton(
            child: Text('Change'),
            onPressed: () {
              final name = textEditingController.text;
              context.read<NameCubit>().change(name);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          // FloatingActionButton(
          //   onPressed: () {
          //     // context.read<CounterCubit>().decrement();
          //   },
          // )
        ],
      ),
    );
  }
}
