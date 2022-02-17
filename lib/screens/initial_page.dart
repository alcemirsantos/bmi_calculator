import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bmi_calculator/controllers/calculadora.dart';
import 'package:bmi_calculator/controllers/tema_cubit.dart';
import 'package:bmi_calculator/models/resutado.dart';
import 'package:bmi_calculator/screens/resultado_page.dart';
import 'package:bmi_calculator/widgets/botao_circular.dart';
import 'package:bmi_calculator/widgets/botao_vermelho.dart';
import 'package:bmi_calculator/widgets/conteudo_card.dart';
import 'package:bmi_calculator/widgets/conteudo_icone.dart';
import 'package:bmi_calculator/widgets/conteudo_numerico.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key? key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  int _altura = 150;
  int _peso = 70;
  int _idade = 20;

  @override
  Widget build(BuildContext context) {
    ColorScheme esquemaDeCores = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora de IMC',
          style: Theme.of(context).textTheme.headline5,
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Switch(
              activeColor: esquemaDeCores.secondary,
              activeTrackColor: esquemaDeCores.secondaryVariant,
              inactiveThumbColor: esquemaDeCores.surface,
              inactiveTrackColor: esquemaDeCores.surface.withAlpha(100),
              value:
                  context.read<TemaCubit>().state.brightness == Brightness.light
                      ? false
                      : true,
              onChanged: (_) {
                context.read<TemaCubit>().alteraTema();
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: Bloco(
                    child: ConteudoIcone(
                      data: Icons.male,
                      texto: 'Masculino',
                    ),
                  ),
                ),
                Expanded(
                  child: Bloco(
                    child: ConteudoIcone(
                      data: Icons.female,
                      texto: 'Feminino',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Bloco(
              child: ConteudoNumerico(
                titulo: 'Altura',
                valor: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$_altura',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'cm',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                acoes: [
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor:
                            esquemaDeCores.primary.withAlpha(250),
                        activeTrackColor: esquemaDeCores.onSurface,
                        thumbColor: esquemaDeCores.secondary,
                        overlayColor: esquemaDeCores.secondaryVariant,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 12),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 20),
                      ),
                      child: Slider(
                        min: 50.0,
                        max: 250.0,
                        value: _altura.toDouble(),
                        onChanged: (double novoValor) {
                          setState(() {
                            _altura = novoValor.round();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Bloco(
                    child: ConteudoNumerico(
                      titulo: 'Peso',
                      valor: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '$_peso',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'Kg',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      acoes: [
                        BotaoCircular(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(() {
                              _peso--;
                            });
                          },
                        ),
                        BotaoCircular(
                          icon: Icons.add,
                          onPressed: () {
                            setState(() {
                              _peso++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Bloco(
                    child: ConteudoNumerico(
                      titulo: 'Idade',
                      valor: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '$_idade',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'Anos',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      acoes: [
                        BotaoCircular(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(() {
                              _idade--;
                            });
                          },
                        ),
                        BotaoCircular(
                          icon: Icons.add,
                          onPressed: () {
                            setState(() {
                              _idade++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BotaoVermelho(
              text: 'Calcular',
              onTap: () {
                CalculadoraDeImc calculadoraDeImc =
                    CalculadoraDeImc(_peso, _altura);

                Resultado resultado = calculadoraDeImc.calculaIMC();
                Navigator.pushNamed(
                  context,
                  PaginaResultado.routeName,
                  arguments: resultado,
                );
              }),
        ],
      ),
    );
  }
}
