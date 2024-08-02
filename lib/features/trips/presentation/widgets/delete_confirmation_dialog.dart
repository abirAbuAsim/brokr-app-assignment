// lib/delete_confirmation_dialog.dart

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import the Riverpod package

import '../providers/trip_provider.dart';

// Function to show a delete confirmation dialog
Future<void> showDeleteConfirmation(
    BuildContext context, int index, WidgetRef ref) async {
  if (Platform.isIOS) {
    await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: const Text(
          'Are you sure you want to delete this item?',
          style: TextStyle(
            color: Colors.black,
            fontSize:
                18.0, // Fixed font size instead of using .sp for simplicity
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context), // Cancel deletion
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CupertinoDialogAction(
            onPressed: () {
              ref.read(tripListNotifierProvider.notifier).removeTrip(index);
              ref.read(tripListNotifierProvider.notifier).loadTrips();
              Navigator.pop(context); // Close the confirmation dialog
            },
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  } else {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(
          'Are you sure you want to delete this item?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context), // Cancel deletion
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              ref.read(tripListNotifierProvider.notifier).removeTrip(index);
              ref.read(tripListNotifierProvider.notifier).loadTrips();
              Navigator.pop(context); // Close the confirmation dialog
            },
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
