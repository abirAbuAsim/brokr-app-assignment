import 'package:flutter/material.dart';
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
  final String date;
  final String location;
  final VoidCallback onLongPress;

  const TravelCard({super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.rating,
    required this.count,
    required this.amount,
    required this.date,
    required this.location,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 0.70, color: Color(0xFFD3D3D3)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onLongPress: onLongPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 172,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/384x172"),
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/star_flat.svg',
                            height: 14,
                            width: 14,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            rating,
                            textAlign: TextAlign.right,
                            style: GoogleFonts.inter(
                              color: Color(0xFF646464),
                              fontSize: 8.71,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            '|',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.inter(
                              color: Color(0xFF4F4F4F),
                              fontSize: 8.71,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            '$count Trips',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.inter(
                              color: Color(0xFF646464),
                              fontSize: 8.71,
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
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'day',
                              style: GoogleFonts.inter(
                                color: Color(0xFF4F4F4F),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/location_flat.svg',
                        height: 14,
                        width: 14,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        '$location mi from current location',
                        style: GoogleFonts.inter(
                          color: Color(0xFF646464),
                          fontSize: 12,
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

