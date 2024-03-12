import 'package:equatable/equatable.dart';
import 'package:hire_app/features/home/domain/entities/service_entity.dart';

final class CompanyEntity extends Equatable {
  const CompanyEntity({
    required this.name,
    required this.location,
    required this.category,
    required this.rating,
    this.id,
    this.imageURL,
    this.services = const [],
  });

  final String? id;
  final String name;
  final String location;
  final String category;
  final double rating;
  final String? imageURL;
  final List<ServiceEntity> services;

  @override
  List<Object?> get props => [
        id,
        name,
        location,
        category,
        rating,
        imageURL,
        services,
      ];
}
