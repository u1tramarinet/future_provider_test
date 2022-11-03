
import 'package:flutter/material.dart';

class StatefulTextButton extends TextButton {
  const StatefulTextButton({
    super.key,
    Function()? onPressed,
    required Widget child,
    bool isEnabled = true,
  }) : super(
    onPressed: (isEnabled) ? onPressed : null,
    child: child,
  );
}

TextButton numberButton({
  required int number,
  required Function(int) onPressed,
  bool isEnabled = true,
}) {
  return StatefulTextButton(
    onPressed: () => onPressed(number),
    isEnabled: isEnabled,
    child: Text(
      style: const TextStyle(fontSize: 50),
      '$number',
    ),
  );
}