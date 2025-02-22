import 'package:flutter/material.dart';

import '../models/siri_waveform_controller.dart';
import 'ios_7_siri_waveform_painter.dart';

/// An *iOS 7 Siri-style* waveform.
class IOS7SiriWaveform extends StatefulWidget {
  /// Creates an instance of [IOS7SiriWaveform].
  ///
  /// The [controller] is responsible for controlling the properties and
  /// behavior of the waveform.
  const IOS7SiriWaveform({required this.controller, super.key});

  /// The controller that manages the properties and behavior of the waveform.
  final IOS7SiriWaveformController controller;

  @override
  IOS7SiriWaveformState createState() => IOS7SiriWaveformState();
}

class IOS7SiriWaveformState extends State<IOS7SiriWaveform>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      // Since the AnimationController's value is not utilized in the animation,
      // the duration value does not impact the animation in any way.
      duration: const Duration(seconds: 1),
    );
    _animationController.repeat();
    super.initState();
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customPaint = CustomPaint(
      painter: IOS7SiriWaveformPainter(
        animationController: _animationController,
        controller: widget.controller,
      ),
      size: Size.infinite,
    );

    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) => customPaint,
    );
  }
}
