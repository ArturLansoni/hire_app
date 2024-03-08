class ServiceEntity {
  const ServiceEntity({
    required this.name,
    required this.initialRange,
    required this.finalRange,
    this.imagesURL = const [],
  });

  final String name;
  final double initialRange;
  final double finalRange;
  final List<String> imagesURL;
}
