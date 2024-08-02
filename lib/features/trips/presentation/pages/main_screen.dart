import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entitites/trip.dart';
import '../providers/trip_provider.dart';
import 'update_trip_screen.dart';
import 'my_trip_screen.dart';

class MainScreen extends ConsumerWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  MainScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(tripListNotifierProvider.notifier).addAllTrip([]);

    ref.watch(tripListNotifierProvider.notifier).loadTrips();
    _pageController.addListener(() {
      _currentPage.value = _pageController.page!.round();
    });

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          MyTripsScreen(),
          Center(child: Text("Favorite")),
          Center(child: Text("Trips")),
          Center(child: Text("Inbox")),
          Center(child: Text("Profile")),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _currentPage,
        builder: (context, pageIndex, child) {
          return BottomNavigationBar(
            selectedLabelStyle: GoogleFonts.inter(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: GoogleFonts.inter(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedItemColor: const Color(0xFF6366F1),
            unselectedItemColor: Colors.grey,
            currentIndex: pageIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/buttom_search.svg',
                  height: 24.h,
                  width: 24.w,
                  color: pageIndex == 0 ? const Color(0xFF6366F1) : Colors.grey,
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/buttom_favorities.svg',
                  height: 24.h,
                  width: 24.w,
                  color: pageIndex == 1 ? const Color(0xFF6366F1) : Colors.grey,
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/buttom_trips.svg',
                  height: 24.h,
                  width: 24.w,
                  color: pageIndex == 2 ? const Color(0xFF6366F1) : Colors.grey,
                ),
                label: 'Trips',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/buttom_inbox.svg',
                  height: 24.h,
                  width: 24.w,
                  color: pageIndex == 3 ? const Color(0xFF6366F1) : Colors.grey,
                ),
                label: 'Inbox',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/buttom_profile.svg',
                  height: 24.h,
                  width: 24.w,
                  color: pageIndex == 4 ? const Color(0xFF6366F1) : Colors.grey,
                ),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
          );
        },
      ),
    );
  }
}

