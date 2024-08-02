import 'package:brokr/core/tools.dart';
import 'package:brokr/features/trips/presentation/widgets/choose_action_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../providers/trip_provider.dart';
import '../widgets/travel_card.dart';

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
                            color: const Color(0xFF5A6684),
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
                    color: const Color(0xFFABB2BE),
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
                          color: const Color(0xFF5A6684),
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
              color: const Color(0xFF6366F1),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: GoogleFonts.inter(
              color: const Color(0xFFABB2BE),
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
                  colorFilter: ColorFilter.mode(
                    currentTabIndex == 0 ? primaryColor : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
                text: "Boats",
              ),
              Tab(
                icon: SvgPicture.asset(
                  'assets/svg/car_flat.svg',
                  height: 24.h,
                  width: 24.w,
                  colorFilter: ColorFilter.mode(
                    currentTabIndex == 0 ? primaryColor : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
                text: "Cars",
              ),
              Tab(
                icon: SvgPicture.asset(
                  'assets/svg/house_flat.svg',
                  height: 24.h,
                  width: 24.w,
                  colorFilter: ColorFilter.mode(
                    currentTabIndex == 0 ? primaryColor : Colors.grey,
                    BlendMode.srcIn,
                  ),
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
                    // Show the dialog
                    showChooseActionDialog(context, trip, index, ref);
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
