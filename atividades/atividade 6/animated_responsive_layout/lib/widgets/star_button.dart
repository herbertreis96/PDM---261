import 'package:flutter/material.dart';

class StarButton extends StatefulWidget {
  const StarButton({super.key});

  @override
  State<StarButton> createState() =>
      _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  bool state = false;

  late final ColorScheme _colorScheme =
      Theme.of(context).colorScheme;

  Icon get icon {
    final IconData iconData =
    state ? Icons.star : Icons.star_outline;

    return Icon(
      iconData,
      color: Colors.grey,
      size: 20,
    );
  }

  void toggle() {
    setState(() {
      state = !state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: state ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,

      child: FloatingActionButton(
        mini: true,
        elevation: 0,
        highlightElevation: 0,

        backgroundColor: _colorScheme.surface,

        shape: const CircleBorder(),

        onPressed: toggle,

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: icon,
        ),
      ),
    );
  }
}