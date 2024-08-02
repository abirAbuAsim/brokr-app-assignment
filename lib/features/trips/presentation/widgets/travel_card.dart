import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/tools.dart';

class TravelCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String rating;
  final String count;
  final String amount;
  final bool topHost;
  final bool deal;
  final String date;
  final String location;
  final VoidCallback onLongPress;

  const TravelCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.rating,
    required this.count,
    required this.amount,
    required this.topHost,
    required this.deal,
    required this.date,
    required this.location,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 15.w, vertical: 5.h),
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 0.70.w, color: Color(0xFFD3D3D3)),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.r),
        onLongPress: onLongPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 172.h,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r),
                      ),
                    ),
                  ),
                ),
                if (topHost)
                  Positioned(
                    top: 15,
                    left: 20,
                    child: Container(
                      // width: 88,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      height: 24.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/host_flat.svg',
                            height: 18.h,
                            width: 18.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'Top host',
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (deal)
                  Positioned(
                    bottom: 20,
                    right: 25,
                    child: Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF6366F1),
                        shape: OvalBorder(),
                      ),
                      child: Center(
                        child: Text(
                          'DEAL',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/star_flat.svg',
                            height: 14.h,
                            width: 14.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            rating,
                            textAlign: TextAlign.right,
                            style: GoogleFonts.inter(
                              color: Color(0xFF646464),
                              fontSize: 8.71.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '|',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.inter(
                              color: Color(0xFF4F4F4F),
                              fontSize: 8.71.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '$count Trips',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.inter(
                              color: Color(0xFF646464),
                              fontSize: 8.71.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '\$$amount/',
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'day',
                              style: GoogleFonts.inter(
                                color: Color(0xFF4F4F4F),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/location_flat.svg',
                        height: 14.h,
                        width: 14.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '$location mi from current location',
                        style: GoogleFonts.inter(
                          color: const Color(0xFF646464),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
