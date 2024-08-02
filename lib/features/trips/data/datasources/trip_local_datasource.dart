import '../models/trip_model.dart';

class TripLocalDataSource {

  final List<TripModel> allNewTrip;

  TripLocalDataSource(this.allNewTrip);


  List<TripModel> getTrips(){
    return allNewTrip;
  }

  void addTrip(TripModel trip) {
    // tripBox.add(trip);
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
    // tripBox.addAll(trip);
  }

  void deleteTrip(int index) {
    allNewTrip.removeAt(index);
  }

}