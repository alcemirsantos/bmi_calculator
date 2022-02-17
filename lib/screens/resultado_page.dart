import 'package:bmi_calculator/models/categoria.dart';
import 'package:bmi_calculator/models/resutado.dart';
import 'package:bmi_calculator/widgets/botao_vermelho.dart';
import 'package:bmi_calculator/widgets/conteudo_card.dart';
import 'package:flutter/material.dart';

class PaginaResultado extends StatelessWidget {
  static const String routeName = '/resultado';

  const PaginaResultado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Resultado resultado =
        ModalRoute.of(context)!.settings.arguments as Resultado;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora',
          style: Theme.of(context).textTheme.headline5,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 40.0,
                left: 12.0,
                top: 12.0,
              ),
              child: Text(
                'Resultado',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: Colors.grey.shade100,
                    ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Bloco(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        resultado.categoria.descricao().toUpperCase(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.green),
                      ),
                      Text(
                        resultado.valor.toStringAsFixed(1),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        '${resultado.descricao}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: Colors.grey.shade200,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BotaoVermelho(
              text: 'Re-calcular',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
