part of 'gold_cubit.dart';

@immutable
sealed class GoldState {}

final class GoldInitial extends GoldState {}

final class GoldLoading extends GoldState {}

final class GoldSuccess extends GoldState {
  final GoldModel goldModel;
  GoldSuccess({required this.goldModel});
}

final class GoldFailure extends GoldState {
  final String message;
  GoldFailure({required this.message});
}
