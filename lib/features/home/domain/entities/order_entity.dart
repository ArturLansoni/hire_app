import 'package:equatable/equatable.dart';

final class OrderEntity extends Equatable {
  const OrderEntity({
    required this.date,
    required this.userId,
    required this.description,
    required this.serviceIds,
    this.id,
  });

  final String? id;
  final DateTime date;
  final String userId;
  final String description;
  final List<String> serviceIds;

  @override
  List<Object?> get props => [id, date, userId, description, serviceIds];
}
