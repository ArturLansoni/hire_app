part of 'home_cubit.dart';

final class HomeState extends AsyncState {
  const HomeState(
    super.status, {
    super.error,
    this.companies,
  });
  final List<CompanyEntity>? companies;

  HomeState copyWith({
    AsyncStatus? status,
    Failure? error,
    List<CompanyEntity>? companies,
  }) {
    return HomeState(
      status ?? this.status,
      error: error ?? this.error,
      companies: companies ?? this.companies,
    );
  }

  @override
  List<Object?> get props => [status, error, companies];
}
