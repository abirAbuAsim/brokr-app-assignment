// lib/choose_action_dialog.dart

import 'dart:io';
import 'package:brokr/core/tools.dart';
import 'package:brokr/features/trips/domain/entitites/trip.dart';
import 'package:brokr/features/trips/presentation/pages/update_trip_screen.dart';
import 'package:brokr/features/trips/presentation/widgets/delete_confirmation_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import the Riverpod package

Future<void> showChooseActionDialog(
    BuildContext context, Trip trip, int index, WidgetRef ref) async {
  if (Platform.isIOS) {
    await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          'Choose an action',
          style: TextStyle(
            color: primaryColor,
            fontSize: 25.0, // Use a fixed font size
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateTripScreen(trip: trip),
                ),
              );
            },
            child: Text(
              'Edit',
              style: TextStyle(
                color: primaryColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              showDeleteConfirmation(context, index, ref);
            },
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Color(0xFF4F4F4F),
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
        title: Text(
          'Choose an action',
          style: TextStyle(
            color: primaryColor,
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        content: Text(
          'I Want to...',
          style: TextStyle(
            color: primaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateTripScreen(trip: trip),
                ),
              );
            },
            child: Text(
              'Edit',
              style: TextStyle(
                color: primaryColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              showDeleteConfirmation(context, index, ref);
            },
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Color(0xFF4F4F4F),
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
