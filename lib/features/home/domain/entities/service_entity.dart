class ServiceEntity {
  const ServiceEntity({
    required this.name,
    required this.location,
    required this.category,
    required this.rating,
    this.imageURL,
  });

  final String name;
  final String location;
  final String category;
  final double rating;
  final String? imageURL;
}
