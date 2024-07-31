import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import '../models/trip_model.dart';

class TripLocalDataSource {
  final Box<TripModel> tripBox;

  TripLocalDataSource(this.tripBox);


  final allNewTrip = [
    TripModel(
      id: 1,
      title: 'Title card item full name',
      description: 'Description card item full name',
      count: '10',
      rating: '5',
      amount: '999',
      date: DateTime.now(),
      location: '11.6',
      photos: ['pictures'],
    ),
    TripModel(
      id: 2,
      title: 'Title card item full name',
      description: 'Description card item full name',
      count: '10',
      rating: '5',
      amount: '999',
      date: DateTime.now(),
      location: '11.6',
      photos: ['pictures'],
    ),
    TripModel(
      id: 3,
      title: 'Title card item full name',
      description: 'Description card item full name',
      count: '10',
      rating: '5',
      amount: '999',
      date: DateTime.now(),
      location: '11.6',
      photos: ['pictures'],
    ),
  ];

  List<TripModel> getTrips(){
    return allNewTrip;
  }

  void addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  Future<void> updateTrip(TripModel trip) async {
    updateItemById(allNewTrip, trip.id, trip);
  }
  void updateItemById(List<TripModel> list, int id, TripModel newValue) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].id == id) {
        list[i] = newValue;
        break;
      }
    }
  }
  void addAllNewTrip(List<TripModel> trip) {
    tripBox.addAll(trip);
  }

  void deleteTrip(int index) {
    allNewTrip.removeAt(index);
  }

}