import 'dart:math' as math;

import 'package:flutter/material.dart';

class Backgroundcontainer extends StatefulWidget {
  final Widget child;
  const Backgroundcontainer({super.key,
  required this.child});

  @override
  State<Backgroundcontainer> createState() => _BackgroundcontainerState();
}

class _BackgroundcontainerState extends State<Backgroundcontainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            transform: GradientRotation(math.pi / 4),
            colors: <Color>[
              Color(0xFFE0F7FA),
              Color(0xFFB2EBF2),
            ],
          ),
        ),
        child: widget.child, // acordarme de que siemprel que se declare en el constructor debo poner widget
    );
  }
}