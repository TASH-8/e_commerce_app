import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 50, // Set a fixed height to prevent infinite size
        width: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
