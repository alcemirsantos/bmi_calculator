import 'package:flutter/material.dart';

class BotaoVermelho extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const BotaoVermelho({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        color: Theme.of(context).colorScheme.secondary,
        margin: const EdgeInsets.only(top: 5.0),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .07,
      ),
    );
  }
}
