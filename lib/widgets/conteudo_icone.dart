import 'package:flutter/material.dart';

class ConteudoIcone extends StatelessWidget {
  final IconData data;
  final String texto;

  const ConteudoIcone({
    Key? key,
    required this.data,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          data,
          color: Theme.of(context).colorScheme.onSurface,
          size: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            texto,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ],
    );
  }
}
