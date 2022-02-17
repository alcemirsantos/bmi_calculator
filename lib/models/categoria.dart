enum Categoria {
  magreza,
  normal,
  sobrepeso,
  obesidade,
  obesidadeGrave,
}

extension Texto on Categoria {
  String descricao() {
    switch (this) {
      case Categoria.magreza:
        return 'Magreza';
      case Categoria.normal:
        return 'Normal';
      case Categoria.obesidade:
        return 'Obesidade';
      case Categoria.sobrepeso:
        return 'Sobrepeso';
      case Categoria.obesidadeGrave:
        return 'Obesidade Grave';
    }
  }
}
