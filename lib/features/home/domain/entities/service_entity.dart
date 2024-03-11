import 'package:equatable/equatable.dart';

final class ServiceEntity extends Equatable {
  const ServiceEntity({
    required this.id,
    required this.name,
    required this.initialRange,
    required this.finalRange,
    this.imagesURL = const [],
  });

  final String id;
  final String name;
  final double initialRange;
  final double finalRange;
  final List<String> imagesURL;

  @override
  List<Object?> get props => [id, name, initialRange, finalRange, imagesURL];
}
