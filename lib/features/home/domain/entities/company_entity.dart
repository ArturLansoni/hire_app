import 'package:hire_app/features/home/domain/entities/service_entity.dart';

final class CompanyEntity {
  const CompanyEntity({
    required this.name,
    required this.location,
    required this.category,
    required this.rating,
    this.imageURL,
    this.services = const [],
  });

  final String name;
  final String location;
  final String category;
  final double rating;
  final String? imageURL;
  final List<ServiceEntity> services;
}
