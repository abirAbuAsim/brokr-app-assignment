import 'package:brokr/core/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../providers/trip_provider.dart';
import '../widgets/travel_card.dart';
import 'update_trip_screen.dart';

class MyTripsScreen extends ConsumerWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ref.read(tripListNotifierProvider.notifier).loadTrips();
    final tripListState = ref.watch(tripListNotifierProvider);
    final tripListNotifier = ref.read(tripListNotifierProvider.notifier);
    final tripList = tripListState.trips;
    final currentTabIndex = tripListState.tabIndex;
    return DefaultTabController(
      length: 3, // Number of tabs
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 90.h,
          title: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r),
            ),
            elevation: 3,
            child: Container(
              width: double.infinity,
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/location_flat_appbar.svg',
                          height: 24.h,
                          width: 24.w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'Miami Beach, FL',
                          style: GoogleFonts.inter(
                            color: Color(0xFF5A6684),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: 1.w,
                    color: Color(0xFFABB2BE),
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/date_time_flat.svg',
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '22/11 - 25/11',
                        style: GoogleFonts.inter(
                          color: Color(0xFF5A6684),
                          fontSize: 15.sp,
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
              borderSide: BorderSide(width: 2.0.w, color: primaryColor),
            ),
            labelStyle: GoogleFonts.inter(
              color: Color(0xFF6366F1),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: GoogleFonts.inter(
              color: Color(0xFFABB2BE),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            onTap: (index) {
              tripListNotifier.setTabIndex(index);
            },
            tabs: [
              Tab(
                icon: SvgPicture.asset(
                  'assets/svg/boat_flat.svg',
                  height: 24.h,
                  width: 24.w,
                  color: currentTabIndex == 0 ? primaryColor : Colors.grey,
                ),
                text: "Boats",
              ),
              Tab(
                icon: SvgPicture.asset(
                  'assets/svg/car_flat.svg',
                  height: 24.h,
                  width: 24.w,
                  color: currentTabIndex == 1 ? primaryColor : Colors.grey,
                ),
                text: "Cars",
              ),
              Tab(
                icon: SvgPicture.asset(
                  'assets/svg/house_flat.svg',
                  height: 24.h,
                  width: 24.w,
                  color: currentTabIndex == 2 ? primaryColor : Colors.grey,
                ),
                text: "Stays",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const Center(child: Text('Car Tab')),
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
                  topHost: trip.topHost,
                  deal: trip.deal,
                  date: DateFormat.yMMMEd().format(trip.date).toString(),
                  location: trip.location,
                  onLongPress: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        // title: Text(
                        //   'Are you sure?',
                        //   style: GoogleFonts.inter(
                        //     color: primaryColor,
                        //     fontSize: 25.sp,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                        content: Text(
                          'I Want to...',
                          style: GoogleFonts.inter(
                            color: primaryColor,
                            fontSize: 20.sp,
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
                                      UpdateTripScreen(trip: trip),
                                ),
                              );
                            },
                            child: Text(
                              'Edit',
                              style: GoogleFonts.inter(
                                color: primaryColor,
                                fontSize: 18.sp,
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
                                fontSize: 18.sp,
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
            const Center(
              child: Text('Stays Tab'),
            ),
          ],
        ),
      ),
    );
  }
}
