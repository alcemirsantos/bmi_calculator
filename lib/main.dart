import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bmi_calculator/controllers/tema_cubit.dart';
import 'package:bmi_calculator/screens/initial_page.dart';
import 'package:bmi_calculator/screens/resultado_page.dart';

void main() {
  // BlocOverrides.runZoned(
  // () =>
  runApp(const CalculadoraMassaCorporal());
  //  ,
  // blocObserver: ImcObserver(),
  // );
}

class CalculadoraMassaCorporal extends StatelessWidget {
  const CalculadoraMassaCorporal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TemaCubit>(
      create: (_) => TemaCubit(),
      child: BlocBuilder<TemaCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const PaginaInicial(),
            theme: state,
            routes: {
              PaginaResultado.routeName: (context) => const PaginaResultado(),
            },
          );
        },
      ),
    );
  }
}

class ImcObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('${bloc.runtimeType} $change');
    }
  }
}
