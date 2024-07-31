import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/tools.dart';

class TravelCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date;
  final String location;
  final VoidCallback onDelete;

  TravelCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.onDelete,
  });

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext alertContext) {
          return AlertDialog(
            title: const Text("Description"),
            backgroundColor: Theme
                .of(context)
                .cardColor,
            content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(description),
                ]
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  showAlertDialog(context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            /*Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                icon: Icon(Icons.delete, color: Colors.white),
                onPressed: onDelete,
              ),
            ),
            Positioned(
              left: 16,
              bottom: 60,
              child: Text(
                description,
                style: GoogleFonts.inter(color: Colors.white),
              ),
            ),*/
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          location,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,),
                        ),
                        Text(
                          date,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red[700]),
                          onPressed: onDelete,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date;
  final String location;
  final VoidCallback onLongPress;

  const CarCard({super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
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
                    'Title card item full name',
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
                            '5.0',
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
                            '10 Trips',
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
                              text: '\$999/',
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
                        '11.6 mi from current location',
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

