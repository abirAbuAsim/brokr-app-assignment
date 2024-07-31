import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/datasources/trip_local_datasource.dart';
import '../../data/models/trip_model.dart';
import '../../data/repositories/trip_repository_impl.dart';
import '../../domain/entitites/trip.dart';
import '../../domain/repositories/trip_repository.dart';
import '../../domain/usecases/add_all_trip.dart';
import '../../domain/usecases/add_trip.dart';
import '../../domain/usecases/delete_trip.dart';
import '../../domain/usecases/get_trips.dart';
import '../../domain/usecases/update_trip.dart';

final tripLocalDataSourceProvider = Provider<TripLocalDataSource>((ref) {
  final Box<TripModel> tripBox = Hive.box('trips');
  return TripLocalDataSource(tripBox);
});

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  final localDataSource = ref.read(tripLocalDataSourceProvider);
  return TripRepositoryImpl(localDataSource);
});

final getTripsProvider = Provider<GetTrips>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return GetTrips(repository);
});

final addTripProvider = Provider<AddTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return AddTrip(repository);
});

final addAllNewTripProvider = Provider<AddAllNewTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return AddAllNewTrip(repository);
});

final updateTripProvider = Provider<UpdateTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return UpdateTrip(repository);
});

final deleteTripProvider = Provider<DeleteTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return DeleteTrip(repository);
});

// This provider will manage fetching trips from the repository.
final tripListNotifierProvider = StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
  final getTrips = ref.read(getTripsProvider);
  final addTrip = ref.read(addTripProvider);
  final addAllNewTrip = ref.read(addAllNewTripProvider);
  final updateTrip = ref.read(updateTripProvider);
  final deleteTrip = ref.read(deleteTripProvider);

  return TripListNotifier(getTrips, addTrip, addAllNewTrip, updateTrip, deleteTrip);
});

class TripListNotifier extends StateNotifier<List<Trip>> {
  final GetTrips _getTrips;
  final AddTrip _addTrip;
  final AddAllNewTrip _addAllNewTrip;
  final UpdateTrip _updateTrip;
  final DeleteTrip _deleteTrip;

  TripListNotifier(this._getTrips, this._addTrip, this._addAllNewTrip, this._updateTrip, this._deleteTrip) : super([]);

  // Load trips from the repository and update the state.
  Future<void> loadTrips() async {
    final tripsOrFailure = await _getTrips();
    tripsOrFailure.fold((error) => state = [], (trips) => state = trips);
  }

  Future<void> addNewTrip(Trip trip) async {
    await _addTrip(trip);
    //state = [...state, trip];
  }

  Future<void> addAllTrip(List<Trip> trip) async {
    await _addAllNewTrip(trip);
    //state = [...state, trip];
  }

  Future<void> updateTrip(Trip trip) async {
    await _updateTrip(trip);
    //state = [...state, trip];
  }

  Future<void> removeTrip(int tripId) async {
    await _deleteTrip(tripId);
  }
}