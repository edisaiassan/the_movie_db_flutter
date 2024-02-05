import 'package:flutter/material.dart';

class RequestFailed extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const RequestFailed({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(text),
        ),
        FilledButton(
          onPressed: onPressed,
          child: const Text('Reintentar'),
        ),
      ],
    );
  }
}
