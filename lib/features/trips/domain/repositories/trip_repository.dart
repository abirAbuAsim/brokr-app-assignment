import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entitites/trip.dart';

abstract class TripRepository{
  Future<Either<Failure, List<Trip>>> getTrips();
  Future<void> addTrip(Trip trip);
  Future<void> updateTrip(Trip trip);
  Future<void> addAllNewTrip(List<Trip> trip);
  Future<void> deleteTrip(int index);
}