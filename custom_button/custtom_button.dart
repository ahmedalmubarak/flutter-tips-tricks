import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({Key? key}) : super(key: key);

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool isPressed = false;
  final List<Color> _colors = [
    Colors.pink,
    Colors.purple,
    Colors.deepPurpleAccent,
    Colors.blue[500]!,
    Colors.cyan,
    Colors.cyan,
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.all(16),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        width: 500,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.amber,
          gradient: LinearGradient(
            colors: isPressed ? _colors.reversed.toList() : _colors,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: Center(
          child: Text(
            'Download',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ).animate(autoPlay: false, target: isPressed ? 1 : 0).shimmer(),
    );
  }
}
