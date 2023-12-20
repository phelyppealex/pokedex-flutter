import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimacaoCarregamento extends StatelessWidget {
  const AnimacaoCarregamento({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(
      dimension: 80,
      child: RiveAnimation.asset('images/loading.riv'),
    );
  }
}