import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/tools.dart';
import '../../domain/entitites/trip.dart';
import '../providers/trip_provider.dart';
import '../widgets/custom_text_form_field.dart';

class UpdateTripScreen extends ConsumerWidget {
  final Trip trip;

  UpdateTripScreen({super.key, required this.trip});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController(text: trip.title);
    final descController = TextEditingController(text: trip.description);
    final ratingController = TextEditingController(text: trip.rating);
    final countController = TextEditingController(text: trip.count);
    final amountController = TextEditingController(text: trip.amount);
    final locationController = TextEditingController(text: trip.location);
    final pictureController = TextEditingController(
        text:
            'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D');
    List<String> pictures = [];
    bool selectedDeal = trip.deal;
    bool selectedTopHost = trip.topHost;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    headingTitle: 'Title',
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    headingTitle: 'Description',
                    controller: descController,
                    keyboardType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    headingTitle: 'Rating',
                    controller: ratingController,
                    keyboardType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    headingTitle: 'Trip',
                    controller: countController,
                    keyboardType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Top Host',
                    style: GoogleFonts.inter(
                      color: primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DropdownButtonFormField<bool>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: GoogleFonts.inter(),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade500, width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    value: selectedTopHost,
                    onChanged: (bool? newValue) {
                      selectedTopHost = newValue!;
                    },
                    items: [
                      DropdownMenuItem<bool>(
                        value: true,
                        child: Text(
                          'True',
                          style: GoogleFonts.inter(),
                        ),
                      ),
                      DropdownMenuItem<bool>(
                        value: false,
                        child: Text(
                          'False',
                          style: GoogleFonts.inter(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Deal',
                    style: GoogleFonts.inter(
                      color: primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DropdownButtonFormField<bool>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: GoogleFonts.inter(),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade500, width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    value: selectedDeal,
                    onChanged: (bool? newValue) {
                      selectedDeal = newValue!;
                    },
                    items: [
                      DropdownMenuItem<bool>(
                        value: true,
                        child: Text(
                          'True',
                          style: GoogleFonts.inter(),
                        ),
                      ),
                      DropdownMenuItem<bool>(
                        value: false,
                        child: Text(
                          'False',
                          style: GoogleFonts.inter(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    headingTitle: 'Amount',
                    controller: amountController,
                    keyboardType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    headingTitle: 'Location',
                    controller: locationController,
                    keyboardType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    headingTitle: 'Photo',
                    controller: pictureController,
                    keyboardType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                              topHost: selectedTopHost,
                              deal: selectedDeal,
                              date: DateTime.now(),
                              location: locationController.text,
                              photos: pictures,
                            );
                            ref
                                .read(tripListNotifierProvider.notifier)
                                .updateTrip(newTrip);
                            ref
                                .read(tripListNotifierProvider.notifier)
                                .loadTrips();
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(384,
                              50), // Fixed size to match the rectangle's design
                          backgroundColor: const Color(
                              0xFF6366F1), // Set to the specific color of the rectangle
                          foregroundColor: Colors.white, // White text
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Border radius of 10
                          ),
                        ),
                        child: Text(
                          'Update',
                          style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
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
