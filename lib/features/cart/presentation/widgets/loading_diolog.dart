import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class LoadingAlertDialog extends StatelessWidget {
  const LoadingAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(Constants.PROCCINGORDER),
        ],
      ),
    );
  }
}
