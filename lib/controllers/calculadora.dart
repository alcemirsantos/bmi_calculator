import 'dart:math';

import '../models/categoria.dart';
import '../models/resutado.dart';

class CalculadoraDeImc {
  final int peso;
  final int altura;

  CalculadoraDeImc(this.peso, this.altura);

  Resultado calculaIMC() {
    double imc = peso / pow(altura / 100, 2);
    Categoria categoria = defineCategoria(imc);

    return Resultado(categoria, imc, interpretacao[categoria]);
  }

  Categoria defineCategoria(double imc) {
    if (imc < 18.5) return Categoria.magreza;
    if (imc < 24.9) return Categoria.normal;
    if (imc < 29.9) return Categoria.sobrepeso;
    if (imc < 39.9) return Categoria.obesidade;
    return Categoria.obesidadeGrave;
  }

  Map<Categoria, String> interpretacao = {
    Categoria.magreza: 'Obesidade grau 0. Mas você comer um pouco mais! ;-)',
    Categoria.normal: 'Obesidade grau 0. Cuidado pra não comer muito!',
    Categoria.sobrepeso: 'Obesidade grau 1. Hora de fazer exercícios!',
    Categoria.obesidade: 'Obesidade grau 2. Talvez uma dieta cairia bem!',
    Categoria.obesidadeGrave:
        'Obesidade grau 3. Cuidado, você precisa se cuidar melhor!',
  };
}
