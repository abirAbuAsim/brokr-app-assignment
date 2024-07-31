import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entitites/trip.dart';
import '../providers/trip_provider.dart';
import 'add_trip_screen.dart';
import 'my_trip_screen.dart';

class MainScreen extends ConsumerWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  String profilPic =
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D";

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
        children: [
          MyTripsScreen(),
          const Center(child: Text("Favorite")),
          const Center(child: Text("Trips")),
          const Center(child: Text("Inbox")),
          const Center(child: Text("Profile")),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _currentPage,
        builder: (context, pageIndex, child) {
          return BottomNavigationBar(
            selectedLabelStyle: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: GoogleFonts.inter(
              fontSize: 11,
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
                  height: 24,
                  width: 24,
                  color: pageIndex == 0 ? const Color(0xFF6366F1) : Colors.grey,
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/buttom_favorities.svg',
                  height: 24,
                  width: 24,
                  color: pageIndex == 1 ? const Color(0xFF6366F1) : Colors.grey,
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/buttom_trips.svg',
                  height: 24,
                  width: 24,
                  color: pageIndex == 2 ? const Color(0xFF6366F1) : Colors.grey,
                ),
                label: 'Trips',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/buttom_inbox.svg',
                  height: 24,
                  width: 24,
                  color: pageIndex == 3 ? const Color(0xFF6366F1) : Colors.grey,
                ),
                label: 'Inbox',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/buttom_profile.svg',
                  height: 24,
                  width: 24,
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

