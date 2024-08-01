import 'package:brokr/core/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../providers/trip_provider.dart';
import '../widgets/travel_card.dart';
import 'add_trip_screen.dart';

class CarList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 23,
                top: 227,
                child: Container(
                  width: 384,
                  height: 794,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 384,
                        height: 254,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 384,
                                height: 254,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.70, color: Color(0xFFD3D3D3)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 295,
                              top: 202,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '\$999/',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'day',
                                      style: TextStyle(
                                        color: Color(0xFF4F4F4F),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Positioned(
                              left: 42,
                              top: 206,
                              child: Container(
                                width: 59.92,
                                height: 11,
                                child: const Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: SizedBox(
                                        width: 14.29,
                                        height: 10.91,
                                        child: Text(
                                          '5.0',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF646464),
                                            fontSize: 8.71,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 19.39,
                                      top: 0,
                                      child: SizedBox(
                                        width: 3.06,
                                        height: 10.91,
                                        child: Text(
                                          '|',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF4F4F4F),
                                            fontSize: 8.71,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 26.92,
                                      top: 0,
                                      child: SizedBox(
                                        width: 33,
                                        height: 11,
                                        child: Text(
                                          '10 Trips',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF646464),
                                            fontSize: 8.71,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 42,
                              top: 225,
                              child: Text(
                                '11.6 mi from current location',
                                style: TextStyle(
                                  color: Color(0xFF646464),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 21,
                              top: 181,
                              child: Text(
                                'Title card item full name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 205,
                              child: Container(
                                width: 14,
                                height: 14,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(width: 14, height: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 225,
                              child: Container(
                                width: 14,
                                height: 14,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(width: 14, height: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 384,
                                height: 172,
                                decoration: const ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://via.placeholder.com/384x172"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 384,
                                height: 172,
                                decoration: const ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://via.placeholder.com/384x172"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 340,
                              top: 20,
                              child: Container(
                                width: 24,
                                height: 24,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(width: 24, height: 24),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 20,
                              child: Container(
                                width: 88,
                                height: 24,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 24,
                              top: 23,
                              child: Container(
                                width: 18,
                                height: 18,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(width: 18, height: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 42,
                              top: 24,
                              child: Text(
                                'Top host',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 384,
                        height: 254,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 384,
                                height: 254,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.70, color: Color(0xFFD3D3D3)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 42,
                              top: 224,
                              child: Text(
                                '11.6 mi from current location',
                                style: TextStyle(
                                  color: Color(0xFF646464),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 295,
                              top: 202,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '\$999/',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'day',
                                      style: TextStyle(
                                        color: Color(0xFF4F4F4F),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Positioned(
                              left: 42,
                              top: 206,
                              child: Container(
                                width: 59.92,
                                height: 11,
                                child: const Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: SizedBox(
                                        width: 14.29,
                                        height: 10.91,
                                        child: Text(
                                          '5.0',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF646464),
                                            fontSize: 8.71,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 19.39,
                                      top: 0,
                                      child: SizedBox(
                                        width: 3.06,
                                        height: 10.91,
                                        child: Text(
                                          '|',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF4F4F4F),
                                            fontSize: 8.71,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 26.92,
                                      top: 0,
                                      child: SizedBox(
                                        width: 33,
                                        height: 11,
                                        child: Text(
                                          '10 Trips',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF646464),
                                            fontSize: 8.71,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 21,
                              top: 181,
                              child: Text(
                                'Title card item full name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 205,
                              child: Container(
                                width: 14,
                                height: 14,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(width: 14, height: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 225,
                              child: Container(
                                width: 14,
                                height: 14,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(width: 14, height: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 384,
                                height: 172,
                                decoration: const ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://via.placeholder.com/384x172"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 384,
                                height: 172,
                                decoration: const ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://via.placeholder.com/384x172"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 316,
                              top: 111,
                              child: Container(
                                width: 48,
                                height: 48,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 48,
                                        height: 48,
                                        decoration: const ShapeDecoration(
                                          color: Color(0xFF6366F1),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 5,
                                      top: 16,
                                      child: Text(
                                        'DEAL',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 340,
                              top: 20,
                              child: Container(
                                width: 24,
                                height: 24,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(width: 24, height: 24),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 384,
                        height: 254,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 384,
                                height: 254,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.70, color: Color(0xFFD3D3D3)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 42,
                              top: 224,
                              child: Text(
                                '11.6 mi from current location',
                                style: TextStyle(
                                  color: Color(0xFF646464),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 295,
                              top: 202,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '\$999/',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'day',
                                      style: TextStyle(
                                        color: Color(0xFF4F4F4F),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Positioned(
                              left: 42,
                              top: 206,
                              child: Container(
                                width: 59.92,
                                height: 11,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: SizedBox(
                                        width: 14.29,
                                        height: 10.91,
                                        child: Text(
                                          '5.0',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF646464),
                                            fontSize: 8.71,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 19.39,
                                      top: 0,
                                      child: SizedBox(
                                        width: 3.06,
                                        height: 10.91,
                                        child: Text(
                                          '|',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF4F4F4F),
                                            fontSize: 8.71,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 26.92,
                                      top: 0,
                                      child: SizedBox(
                                        width: 33,
                                        height: 11,
                                        child: Text(
                                          '10 Trips',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF646464),
                                            fontSize: 8.71,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21,
                              top: 181,
                              child: Text(
                                'Title card item full name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 205,
                              child: Container(
                                width: 14,
                                height: 14,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(width: 14, height: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 225,
                              child: Container(
                                width: 14,
                                height: 14,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(width: 14, height: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 384,
                                height: 172,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://via.placeholder.com/384x172"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 384,
                                height: 172,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://via.placeholder.com/384x172"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 340,
                              top: 20,
                              child: Container(
                                width: 24,
                                height: 24,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(width: 24, height: 24),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 48.50,
                top: 0,
                child: Container(
                  width: 340,
                  height: 31.44,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 12.44,
                        child: Text(
                          '9:41',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 284.65,
                        top: 15.94,
                        child: Container(
                          width: 3.35,
                          height: 12,
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 279.10,
                        top: 18.34,
                        child: Container(
                          width: 3.35,
                          height: 9.60,
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 273.55,
                        top: 20.94,
                        child: Container(
                          width: 3.35,
                          height: 7,
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 268,
                        top: 23.34,
                        child: Container(
                          width: 3.35,
                          height: 4.60,
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 314.04,
                        top: 17.10,
                        child: Container(
                          width: 21.38,
                          height: 9.69,
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.33),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 312,
                        top: 14.94,
                        child: Opacity(
                          opacity: 0.40,
                          child: Container(
                            width: 25.45,
                            height: 14,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(3.50),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 830,
                child: Container(
                  width: 430,
                  height: 102,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 430,
                          height: 102,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        left: 139.89,
                        top: 87.80,
                        child: Container(
                          width: 150.21,
                          height: 5.73,
                          decoration: ShapeDecoration(
                            color: Color(0x33001227),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            shadows: [
                              BoxShadow(
                                color: Color(0x1A151C30),
                                blurRadius: 50,
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 430,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.70,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFD3D3D3),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 360,
                        top: 45,
                        child: Text(
                          'Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF9E9E9E),
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 284,
                        top: 44,
                        child: Text(
                          'Inbox',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF9E9E9E),
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 202,
                        top: 46,
                        child: Text(
                          'Trips',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF9E9E9E),
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 111,
                        top: 45,
                        child: Text(
                          'Favorite',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF9E9E9E),
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 29,
                        top: 46,
                        child: SizedBox(
                          width: 43,
                          height: 12,
                          child: Text(
                            'Explore',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF6366F1),
                              fontSize: 11,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 286,
                        top: 13,
                        child: Container(
                          width: 24,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(width: 24, height: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 365,
                        top: 13,
                        child: Container(
                          width: 24,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(width: 24, height: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 120,
                        top: 13,
                        child: Container(
                          width: 24,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(width: 24, height: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 203,
                        top: 13,
                        child: Container(
                          width: 24,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(width: 24, height: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 38,
                        top: 13,
                        child: Container(
                          width: 24,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(width: 24, height: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 23,
                top: 75,
                child: Container(
                  width: 384,
                  height: 48,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 384,
                          height: 48,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.70, color: Color(0xFFE2E2E2)),
                              borderRadius: BorderRadius.circular(48),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x33000000),
                                blurRadius: 15,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 43,
                        top: 15,
                        child: Text(
                          'Miami Beach, FL',
                          style: TextStyle(
                            color: Color(0xFF5A6684),
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 281,
                        top: 16,
                        child: Text(
                          '22/11 - 25/11',
                          style: TextStyle(
                            color: Color(0xFF5A6684),
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 11,
                        top: 12,
                        child: Container(
                          width: 24,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(width: 24, height: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 239,
                        top: 12,
                        child: Container(
                          width: 24,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(width: 24, height: 24),
                              ),
                              Positioned(
                                left: 13,
                                top: 13,
                                child: Container(
                                  width: 9,
                                  height: 9,
                                  decoration: ShapeDecoration(
                                    shape: OvalBorder(
                                      side: BorderSide(
                                        width: 1.50,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Color(0xFF5A6684),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 227,
                        top: 6,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(1.57),
                          child: Container(
                            width: 36,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFABB2BE),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 204,
                child: Container(
                  width: 430,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.70,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFD3D3D3),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 23,
                top: 124,
                child: Container(
                  width: 248,
                  height: 80,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(width: 128, height: 80),
                      ),
                      Positioned(
                        left: 138,
                        top: 80,
                        child: Container(
                          width: 110,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFF6366F1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 48,
                        top: 22,
                        child: Container(
                          width: 32,
                          height: 32,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(width: 32, height: 32),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 48,
                        top: 60,
                        child: Text(
                          'Boats',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFABB2BE),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 151,
                top: 124,
                child: Container(
                  width: 128,
                  height: 80,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(width: 128, height: 80),
                      ),
                      const Positioned(
                        left: 50,
                        top: 60,
                        child: Text(
                          'Cars',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF6366F1),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 48,
                        top: 22,
                        child: Container(
                          width: 32,
                          height: 32,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(width: 32, height: 32),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 279,
                top: 124,
                child: Container(
                  width: 128,
                  height: 80,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(width: 128, height: 80),
                      ),
                      Positioned(
                        left: 48,
                        top: 60,
                        child: Text(
                          'Stays',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFABB2BE),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 48,
                        top: 22,
                        child: Container(
                          width: 32,
                          height: 32,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(width: 32, height: 32),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
