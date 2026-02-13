part of 'silver_cubit.dart';

@immutable
sealed class SilverState {}

final class SilverInitial extends SilverState {}

final class SilverLoading extends SilverState {}

final class SilverSuccess extends SilverState {
  final SilverModel silverModel;
  SilverSuccess({required this.silverModel});
}

final class SilverFailure extends SilverState {
  final String message;
  SilverFailure({required this.message});
}
