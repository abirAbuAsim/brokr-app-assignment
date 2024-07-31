import '../entitites/trip.dart';
import '../repositories/trip_repository.dart';

class AddAllNewTrip {
  final TripRepository repository;

  AddAllNewTrip(this.repository);

  Future<void> call(List<Trip> trips){
    return repository.addAllNewTrip(trips);
  }
}