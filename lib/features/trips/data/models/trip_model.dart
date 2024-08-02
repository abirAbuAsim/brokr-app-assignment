import '../../domain/entitites/trip.dart';

class TripModel {

  final int id;
  final String title;
  final List<String> photos;
  final String description;
  final String rating;
  final String count;
  final String amount;
  final bool topHost;
  final bool deal;
  final DateTime date;
  final String location;

  TripModel({
    required this.id,
    required this.title,
    required this.photos,
    required this.description,
    required this.rating,
    required this.count,
    required this.amount,
    required this.topHost,
    required this.deal,
    required this.date,
    required this.location,
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
      topHost: trip.topHost,
      deal: trip.deal,
      date: trip.date,
      location: trip.location
  );

  // Conversion from Model to Entity
  Trip toEntity() => Trip(
      id: id,
      title: title,
      photos: photos,
      description: description,
      rating: rating,
      count: count,
      amount: amount,
      topHost: topHost,
      deal: deal,
      date: date,
      location: location
  );

}