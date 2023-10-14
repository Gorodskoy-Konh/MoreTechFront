part of 'optimal_office_cubit.dart';

@immutable
sealed class OptimalOfficeState {}

class OptimalOfficeInitial extends OptimalOfficeState {}

class OptimalOfficeLoading extends OptimalOfficeState {}

class OptimalOfficeFound extends OptimalOfficeState {
  final List<Office> optimalOffices;

  OptimalOfficeFound({required this.optimalOffices});
}
