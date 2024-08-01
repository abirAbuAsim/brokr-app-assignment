import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entitites/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final List<String> photos;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final String rating;

  @HiveField(5)
  final String count;

  @HiveField(6)
  final String amount;

  @HiveField(7)
  final DateTime date;

  @HiveField(8)
  final String location;

  @HiveField(9)
  final String isTopHost;

  TripModel({
    required this.id,
    required this.title,
    required this.photos,
    required this.description,
    required this.rating,
    required this.count,
    required this.amount,
    required this.date,
    required this.location,
    required this.isTopHost,
  });
  // Conversion from Entity to Model
  factory TripModel.fromEntity(Trip trip) => TripModel(
      id: trip.id,
      title: trip.title,
      photos: trip.photos,
      description: trip.description,
      rating: trip.rating,
      count: trip.count,
      amount: trip.amount,
      date: trip.date,
      location: trip.location,
      isTopHost: trip.isTopHost);

  // Conversion from Model to Entity
  Trip toEntity() => Trip(
      id: id,
      title: title,
      photos: photos,
      description: description,
      rating: rating,
      count: count,
      amount: amount,
      date: date,
      location: location,
      isTopHost: isTopHost);
}
