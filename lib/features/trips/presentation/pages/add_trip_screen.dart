import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entitites/trip.dart';
import '../providers/trip_provider.dart';
import '../widgets/custom_text_form_field.dart';

class AddTripScreen extends ConsumerWidget {
  final Trip trip;
  AddTripScreen({super.key, required this.trip});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController(text: trip.title);
    final descController = TextEditingController(text: trip.description);
    final ratingController = TextEditingController(text: trip.rating);
    final countController = TextEditingController(text: trip.count);
    final amountController = TextEditingController(text: trip.amount);
    final locationController = TextEditingController(text: trip.location);
    final isTopHostController = TextEditingController(text: trip.isTopHost);
    final pictureController = TextEditingController(
        text:
            'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D');
    List<String> pictures = [];
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    headingTitle: 'Title',
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    headingTitle: 'Description',
                    controller: descController,
                    keyboardType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    headingTitle: 'Rating',
                    controller: ratingController,
                    keyboardType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    headingTitle: 'Trip',
                    controller: countController,
                    keyboardType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    headingTitle: 'Amount',
                    controller: amountController,
                    keyboardType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    headingTitle: 'Location',
                    controller: locationController,
                    keyboardType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    headingTitle: 'Photo',
                    controller: pictureController,
                    keyboardType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      pictures.add(pictureController.text);
                      if (_formKey.currentState!.validate()) {
                        final newTrip = Trip(
                          id: trip.id,
                          title: titleController.text,
                          description: descController.text,
                          count: countController.text,
                          amount: amountController.text,
                          rating: ratingController.text,
                          date: DateTime.now(),
                          location: locationController.text,
                          isTopHost: isTopHostController.text,
                          photos: pictures,
                        );
                        ref
                            .read(tripListNotifierProvider.notifier)
                            .updateTrip(newTrip);
                        ref.read(tripListNotifierProvider.notifier).loadTrips();
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Add Trip'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
