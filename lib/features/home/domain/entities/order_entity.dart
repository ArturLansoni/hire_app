import 'package:equatable/equatable.dart';
import 'package:hire_app/features/home/domain/entities/service_entity.dart';

final class OrderEntity extends Equatable {
  const OrderEntity({
    required this.date,
    required this.userId,
    required this.description,
    this.id,
    this.services = const [],
  });

  final String? id;
  final DateTime date;
  final String userId;
  final String description;
  final List<ServiceEntity> services;

  @override
  List<Object?> get props => [
        id,
        date,
        userId,
        description,
        services,
      ];
}
