import 'package:brokr/core/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../providers/trip_provider.dart';
import '../widgets/travel_card.dart';
import 'add_trip_screen.dart';

class MyTripsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ref.read(tripListNotifierProvider.notifier).loadTrips();
    final tripList = ref.watch(tripListNotifierProvider);
    return DefaultTabController(
      length: 3, // Number of tabs
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 60,
          title: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 3,
            child: Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/location_flat_appbar.svg',
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Miami Beach, FL',
                          style: GoogleFonts.inter(
                            color: Color(0xFF5A6684),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: 1,
                    color: Color(0xFFABB2BE),
                    margin: EdgeInsets.symmetric(vertical: 5),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/date_time_flat.svg',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '22/11 - 25/11',
                        style: GoogleFonts.inter(
                          color: Color(0xFF5A6684),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            dividerColor: Colors.grey.shade300,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: primaryColor),
            ),
            tabs: const [
              Tab(icon: Icon(Icons.directions_car), text: "Car"),
              Tab(icon: Icon(Icons.directions_transit), text: "Transit"),
              Tab(icon: Icon(Icons.directions_bike), text: "Bike"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Car Tab')),
            ListView.builder(
              itemCount: tripList.length,
              itemBuilder: (context, index) {
                final trip = tripList[index];
                return TravelCard(
                  imageUrl: trip.photos[0],
                  title: trip.title,
                  description: trip.description,
                  rating: trip.rating,
                  count: trip.count,
                  amount: trip.amount,
                  date: DateFormat.yMMMEd().format(trip.date).toString(),
                  location: trip.location,
                  isTopHost: 'YES',
                  onLongPress: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Are you sure?',
                          style: GoogleFonts.inter(
                            color: primaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        content: Text(
                          'Do you want to',
                          style: GoogleFonts.inter(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddTripScreen(trip: trip),
                                ),
                              );
                            },
                            child: Text(
                              'Edit',
                              style: GoogleFonts.inter(
                                color: primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(tripListNotifierProvider.notifier)
                                  .removeTrip(index);
                              ref
                                  .read(tripListNotifierProvider.notifier)
                                  .loadTrips();
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Delete',
                              style: GoogleFonts.inter(
                                color: Color(0xFF4F4F4F),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            Center(
              child: Text('Bike Tab'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter();
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;
    final double width =
        configuration.size!.width / 2; // Adjust the width as needed
    const double height = 4.0; // Adjust the height as needed
    final double xOffset = offset.dx + (configuration.size!.width - width) / 2;
    final double yOffset = offset.dy + configuration.size!.height - height;
    final Rect rect = Rect.fromLTWH(xOffset, yOffset, width, height);
    final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(4.0));
    canvas.drawRRect(rrect, paint);
  }
}
