import 'package:flutter/material.dart';

class NoItemsFound extends StatelessWidget {
  const NoItemsFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/thinking-face-emoji-thoughtful.png',
              width: 48,
              height: 48,
            ),
            const SizedBox(height: 24),
            Text(
              'We couldn’t find any results!',
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
