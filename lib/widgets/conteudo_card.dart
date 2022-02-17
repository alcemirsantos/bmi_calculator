import 'package:flutter/material.dart';

class Bloco extends StatelessWidget {
  final Widget child;
  const Bloco({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}
