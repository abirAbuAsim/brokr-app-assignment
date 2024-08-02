import 'package:flutter_riverpod/flutter_riverpod.dart';
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

final trips = [
  Trip(
    id: 1,
    title: 'Title card item full name',
    description: 'Description card item full name',
    count: '10',
    rating: '5',
    amount: '999',
    date: DateTime.now(),
    location: '11.6',
    topHost: true,
    deal: false,
    photos: [
      'https://images.unsplash.com/photo-1570294646112-27ce4f174e38?ixlib=rb-4.0.3'
    ],
  ),
  Trip(
    id: 2,
    title: 'Title card item full name',
    description: 'Description card item full name',
    count: '10',
    rating: '5',
    amount: '999',
    topHost: false,
    deal: true,
    date: DateTime.now(),
    location: '11.6',
    photos: [
      'https://images.unsplash.com/photo-1570294646112-27ce4f174e38?ixlib=rb-4.0.3'
    ],
  ),
  Trip(
    id: 3,
    title: 'Title card item full name',
    description: 'Description card item full name',
    count: '10',
    rating: '5',
    amount: '999',
    topHost: true,
    deal: true,
    date: DateTime.now(),
    location: '11.6',
    photos: [
      'https://images.unsplash.com/photo-1570294646112-27ce4f174e38?ixlib=rb-4.0.3'
    ],
  ),
];

final tripLocalDataSourceProvider = Provider<TripLocalDataSource>((ref) {
// TODO: send list
  final allNewTrip =
      List<TripModel>.from(trips.map((x) => TripModel.fromEntity(x)));
  return TripLocalDataSource(allNewTrip);
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
final tripListNotifierProvider =
    StateNotifierProvider<TripListNotifier, TripListState>((ref) {
  final getTrips = ref.read(getTripsProvider);
  final addTrip = ref.read(addTripProvider);
  final addAllNewTrip = ref.read(addAllNewTripProvider);
  final updateTrip = ref.read(updateTripProvider);
  final deleteTrip = ref.read(deleteTripProvider);

  final notifier = TripListNotifier(getTrips, addTrip, addAllNewTrip, updateTrip, deleteTrip);
  notifier.loadTrips(); // Load trips on initialization
  return notifier;
});

class TripListNotifier extends StateNotifier<TripListState> {
  final GetTrips _getTrips;
  final AddTrip _addTrip;
  final AddAllNewTrip _addAllNewTrip;
  final UpdateTrip _updateTrip;
  final DeleteTrip _deleteTrip;

  TripListNotifier(this._getTrips, this._addTrip, this._addAllNewTrip,
      this._updateTrip, this._deleteTrip)
      : super(TripListState(trips: [], tabIndex: 1));

  // Load trips from the repository and update the state.
  Future<void> loadTrips() async {
    final tripsOrFailure = await _getTrips();
    tripsOrFailure.fold(
          (error) => state = state.copyWith(trips: []), // Handle the error state more gracefully as needed
          (trips) => state = state.copyWith(trips: trips),
    );
  }

  Future<void> addNewTrip(Trip trip) async {
    await _addTrip(trip);
  }

  Future<void> addAllTrip(List<Trip> trip) async {
    await _addAllNewTrip(trips);
  }

  Future<void> updateTrip(Trip trip) async {
    await _updateTrip(trip);
  }

  Future<void> removeTrip(int tripId) async {
    await _deleteTrip(tripId);
  }

  Future<void> setTabIndex(int index) async {
    state = state.copyWith(tabIndex: index);
  }
}

// State class to hold trips and the current tab index
class TripListState {
  final List<Trip> trips;
  final int tabIndex;

  TripListState({required this.trips, required this.tabIndex});

  TripListState copyWith({List<Trip>? trips, int? tabIndex}) {
    return TripListState(
      trips: trips ?? this.trips,
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }
}