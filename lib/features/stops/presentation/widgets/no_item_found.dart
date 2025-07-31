import 'package:flutter/material.dart';

/// A widget that displays a message when no items are found.
/// This widget is typically used in lists or search results to indicate that
/// there are no items matching the search criteria.
/// It includes an image and a text message to inform the user.
/// The widget is styled to be centered and has a padding at the top.
/// It can be used in various parts of the app where a "no items found" message
/// is needed, such as in search results or empty lists.
/// Example usage:
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
