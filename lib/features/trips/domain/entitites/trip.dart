class Trip {
  final int id;
  final String title;
  final List<String> photos;
  final String description;
  final String rating;
  final String count;
  final String amount;
  final DateTime date;
  final String location;

  Trip({required this.id, required this.title, required this.photos, required this.description, required this.rating, required this.count, required this.amount, required this.date, required this.location});
}