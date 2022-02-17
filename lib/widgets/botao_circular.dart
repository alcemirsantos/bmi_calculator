import 'package:flutter/material.dart';

class BotaoCircular extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  const BotaoCircular({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      constraints: const BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: const CircleBorder(),
      fillColor: Theme.of(context).colorScheme.secondary,
      onPressed: onPressed,
    );
  }
}
