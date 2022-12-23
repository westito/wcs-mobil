import 'package:flutter/material.dart';
import 'package:wcs_mobil/ui/widgets/space.dart';

class LoadErrorWidget extends StatelessWidget {
  final Object error;
  final StackTrace stackTrace;
  final VoidCallback onRetry;

  LoadErrorWidget(
    this.error,
    this.stackTrace, {
    required this.onRetry,
  }) {
    debugPrintStack(label: error.toString(), stackTrace: stackTrace);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_rounded, size: 64, color: theme.colorScheme.error),
          const VSpace(12),
          Text(
            'Something went wrong!',
            textAlign: TextAlign.center,
            style: theme.textTheme.headline6,
          ),
          const VSpace(24),
          Text(
            'Technical information:',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyText2
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            '$error\n$stackTrace',
            maxLines: 10,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyText2,
          ),
          const VSpace(24),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
