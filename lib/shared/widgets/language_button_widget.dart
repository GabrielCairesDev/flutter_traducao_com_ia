import 'package:flutter/material.dart';

class LanguageButtonWidget extends StatelessWidget {
  final String flagEmoji;
  final String language;
  final VoidCallback onPressed;

  const LanguageButtonWidget({
    super.key,
    required this.flagEmoji,
    required this.language,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text('$flagEmoji $language'),
      ),
    );
  }
}
